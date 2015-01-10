using UnityEngine;
using System.Collections;

public class MoveAnimation : MonoBehaviour {

public GameObject player;
	Animation animation;
	private float BaseAnimationSpeed = 0.5f;
	private float AnimationSpeedModifier = 0.25f;

	// Use this for initialization
	void Start () {
	
		animation = GetComponent<Animation> ();

	}
	
	// Update is called once per frame
	void Update () {
	
		animation [animation.clip.name].speed = player.GetComponent<CharacterMotor> ().movement.velocity.magnitude * AnimationSpeedModifier + BaseAnimationSpeed;
	}
}
