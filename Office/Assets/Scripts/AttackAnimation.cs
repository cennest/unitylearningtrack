using UnityEngine;
using System.Collections;

public class AttackAnimation : MonoBehaviour {

	public AnimationClip AttackAnimationClip;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
		if (Input.GetMouseButton (0)) {
						animation.Play (AttackAnimationClip.name);
				} else if (animation [AttackAnimationClip.name].time > animation [AttackAnimationClip.name].length) {
			animation.CrossFade(animation.clip.name);		
		}

	}
}
