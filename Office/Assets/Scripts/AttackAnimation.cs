using UnityEngine;
using System.Collections;

public class AttackAnimation : MonoBehaviour,IPickupable {

	public AnimationClip AttackAnimationClip;
	bool isMounted = false;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
		if (!isMounted)
						return;

		if (Input.GetMouseButton (0)) {
						animation.Play (AttackAnimationClip.name);
				} else if (animation [AttackAnimationClip.name].time > animation [AttackAnimationClip.name].length) {
			animation.CrossFade(animation.clip.name);		
		}

	}

	#region IPickupable implementation

	public void PickUp (GameObject player)
	{
		isMounted = true;
		animation.Play ();
	}

	#endregion
}
