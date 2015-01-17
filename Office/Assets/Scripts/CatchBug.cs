using UnityEngine;
using System.Collections;


[RequireComponent(typeof(AudioSource))]
public class CatchBug : MonoBehaviour
{
		public AnimationClip deathAnimation;
	    public AnimationClip jumpAnimation;
	    public AudioClip deathClip;
	    public AudioClip jumpClip;
		public AIFollow aiFollow;
	    public UILabel developerBugCountLabel;
	    public UILabel testerBugCountLabel;
	   
		void OnTriggerEnter (Collider other)
		{
				if (other.gameObject.tag == "Developer") {
//						removeCollider ();
//						animation.CrossFade (deathAnimation.name);
//						aiFollow.canMove = false;
//						audio.PlayOneShot (deathClip);						
//						int count = 0;
//						System.Int32.TryParse (developerBugCountLabel.text, out count);
//						count++;
//						developerBugCountLabel.text = count.ToString ();
//						Destroy (this.gameObject, 1);

				} else if (other.gameObject.tag == @"Tester") {
						removeCollider ();
						animation.CrossFade (jumpAnimation.name);
						aiFollow.canMove = false;
						audio.PlayOneShot (jumpClip);						
						int count = 0;
						System.Int32.TryParse (testerBugCountLabel.text, out count);
						count++;
						testerBugCountLabel.text = count.ToString ();
						Destroy (this.gameObject, 1);
				}
		}

	void removeCollider ()
	{
		BoxCollider[] myColliders = gameObject.GetComponents<BoxCollider>();
		foreach(BoxCollider bc in myColliders) {
			bc.enabled = false;
		}
	}

}