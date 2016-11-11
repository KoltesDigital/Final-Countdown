using UnityEngine;

public class Gameplay : MonoBehaviour
{
	[Tooltip("Initial time in seconds.")]
	public float initialTime = 300.0f;

	public string resetInputName = "Reset";

	[Tooltip("Time when the alarm begins in seconds.")]
	public float alarmTime = 10.0f;

	public AudioSource alarmSource;

	public Material backgroundMaterial;
	public string backgroundRatioAttributeName;

	private float currentTime;

	void Start()
	{
		currentTime = initialTime;
	}

	void Update()
	{
		currentTime -= Time.deltaTime;

		if (Input.GetButtonDown(resetInputName))
		{
			currentTime = initialTime;
			alarmSource.Stop();
			// TODO reward
		}

		if (currentTime <= 0.0f)
		{
			// TODO game over
		}
		else
		{
			if (currentTime <= alarmTime)
			{
				alarmSource.Play();
			}

			float ratio = currentTime / initialTime;
			backgroundMaterial.SetFloat(backgroundRatioAttributeName, ratio);
		}
	}
}
