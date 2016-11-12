using UnityEngine;

public class Gameplay : MonoBehaviour
{
	[Tooltip("DEBUG ONLY! Use this to accelerate time.")]
	public float timeScale = 1.0f;

	[Tooltip("Initial time in seconds.")]
	public float initialTime = 300.0f;

	public string resetInputName = "Reset";

	[Tooltip("Time when the alarm begins in seconds.")]
	public float alarmTime = 15.0f;

	public AudioSource alarmSource;
	public GameObject alarmFX;

	public float timeUpDuration;
	public GameObject timeUpFX;
	public AudioClip timeUpAudioClip;

	public GameObject neigeFX;

	public Material backgroundMaterial;
	public string backgroundRatioAttributeName;

	public Material[] textMaterials;
	public MeshRenderer[] textRenderers;
	public MeshRenderer separatorRenderer;
	public GameObject textContainer;

	private float currentTime;
	private float timeUpEndTime;
	private float deadTime;

	void Start()
	{
		currentTime = initialTime;
		timeUpEndTime = Time.time;
		UpdateTimeRenderers();
	}

	void Update()
	{
		currentTime -= Time.deltaTime * timeScale;

		if (Time.time >= timeUpEndTime)
		{
			timeUpFX.SetActive(false);

			if (Input.GetButtonDown(resetInputName))
			{
				currentTime = initialTime;
				alarmSource.Stop();
				alarmFX.SetActive(false);
				timeUpFX.SetActive(true);
				timeUpEndTime = Time.time + timeUpDuration;
				alarmSource.PlayOneShot(timeUpAudioClip);
			}
		}

		if (currentTime <= 0.0f)
		{
			currentTime = 0.0f;
			UpdateTimeRenderers();
			separatorRenderer.enabled = true;

			alarmSource.Stop();
			alarmFX.SetActive(false);
			neigeFX.SetActive(false);

			deadTime += Time.deltaTime;
			deadTime = deadTime % 1.0f;
			textContainer.SetActive(deadTime < 0.5f);
		}
		else
		{
			if (currentTime <= alarmTime && !alarmSource.isPlaying)
			{
				alarmSource.Play();
				alarmFX.SetActive(true);
			}

			float ratio = 1.0f - currentTime / initialTime;
			backgroundMaterial.SetFloat(backgroundRatioAttributeName, ratio);

			UpdateTimeRenderers();
		}
	}

	void UpdateTimeRenderers()
	{
		int seconds = Mathf.CeilToInt(currentTime);
		int minutes = seconds / 60;
		seconds = seconds % 60;

		UpdateTimeSegmentRenderers(minutes, textRenderers[0], textRenderers[1]);
		UpdateTimeSegmentRenderers(seconds, textRenderers[2], textRenderers[3]);

		separatorRenderer.enabled = (currentTime % 1.0f >= 0.5f);
	}

	void UpdateTimeSegmentRenderers(int time, MeshRenderer highRenderer, MeshRenderer lowRenderer)
	{
		int high = time / 10;
		int low = time % 10;

		UpdateTimeSegmentRenderer(high, highRenderer);
		UpdateTimeSegmentRenderer(low, lowRenderer);
	}

	void UpdateTimeSegmentRenderer(int number, MeshRenderer renderer)
	{
		renderer.material = textMaterials[number];
	}
}
