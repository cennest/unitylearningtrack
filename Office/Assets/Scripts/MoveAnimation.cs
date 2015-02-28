using UnityEngine;
using System.Collections;

public class MoveAnimation : MonoBehaviour,IPickupable {

	GameObject gamePlayer;
	Animation animation;
	private float BaseAnimationSpeed = 0.5f;
	private float AnimationSpeedModifier = 0.25f;
	public UILabel PlayerNameLabel;
	bool isMounted = false;

	// Use this for initialization
	void Start () {	

		//postTest ();
		//getTest ();
		PlayerNameLabel.text = PlayerPrefs.GetString("Player Name");
		animation = GetComponent<Animation> ();

	}

	// Update is called once per frame
	void Update () {
	
		if (!isMounted)
						return;

		animation [animation.clip.name].speed = gamePlayer.GetComponent<CharacterMotor> ().movement.velocity.magnitude * AnimationSpeedModifier + BaseAnimationSpeed;
	}

	#region IPickupable implementation

	public void PickUp (GameObject player)
	{
		isMounted = true;
		gamePlayer = player;
	}

	#endregion
}
