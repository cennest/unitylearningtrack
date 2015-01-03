using UnityEngine;
using System.Collections;

public class CatchBug : MonoBehaviour
{

		public AnimationClip deathAnimation;
	public AudioClip deathClip;
		public AIFollow aiFollow;

		// Use this for initialization
		void Start ()
		{
	
		}
	
		// Update is called once per frame
		void Update ()
		{
		//yield return new WaitForSeconds(1.0f);

		
	}

		void OnTriggerEnter (Collider other)
		{
				if (other.gameObject.tag == "Developer") {
						animation.CrossFade (deathAnimation.name);
						aiFollow.canMove = false;
			audio.PlayOneShot(deathClip);
			Destroy (this.gameObject,1);

	  	       } else if (other.gameObject.tag == @"Tester") {
				
						Destroy (this.gameObject);
				}
		}

}
