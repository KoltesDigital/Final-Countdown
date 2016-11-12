using UnityEngine;

public class Gameplay : MonoBehaviour
{
	[Tooltip("DEBUG ONLY! Use this to accelerate time.")]
	public float timeScale = 1.0f;

	[Tooltip("Initial time in seconds.")]
	public float initialTime = 300.0f;

	public string resetInputName = "Reset";

	[Tooltip("Time when the alarm begins in seconds.")]
	public float alarmTime = 10.0f;

	public AudioSource alarmSource;

	public Material backgroundMaterial;
	public string backgroundRatioAttributeName;

	public Material[] textMaterials;
	public MeshRenderer[] textRenderers;
	public MeshRenderer separatorRenderer;

	private float currentTime;

	void Start()
	{
		currentTime = initialTime;
		UpdateTimeRenderers();
	}

	void Update()
	{
		currentTime -= Time.deltaTime * timeScale;

		if (Input.GetButtonDown(resetInputName))
		{
			currentTime = initialTime;
			alarmSource.Stop();
			// TODO reward
		}

		if (currentTime <= 0.0f)
		{
			currentTime = 0.0f;
			// TODO game over
		}
		else
		{
			if (currentTime <= alarmTime)
			{
				alarmSource.Play();
			}

			float ratio = 1.0f - currentTime / initialTime;
			backgroundMaterial.SetFloat(backgroundRatioAttributeName, ratio);
		}

		UpdateTimeRenderers();
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
