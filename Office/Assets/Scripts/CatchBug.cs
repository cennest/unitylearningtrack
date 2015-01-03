using UnityEngine;
using System.Collections;


[RequireComponent(typeof(AudioSource))]
public class CatchBug : MonoBehaviour
{
		public AnimationClip deathAnimation;
	    public AudioClip deathClip;
		public AIFollow aiFollow;
	    public UILabel developerBugCountLabel;
	    public UILabel testerBugCountLabel;

		void OnTriggerEnter (Collider other)
		{
				if (other.gameObject.tag == "Developer") {
						animation.CrossFade (deathAnimation.name);
						aiFollow.canMove = false;
						audio.PlayOneShot (deathClip);
						Destroy (this.gameObject, 1);

						int count = 0;
						System.Int32.TryParse (developerBugCountLabel.text, out count);
						count++;

						developerBugCountLabel.text = count.ToString ();

				} else if (other.gameObject.tag == @"Tester") {
				
			            audio.PlayOneShot (deathClip);
						Destroy (this.gameObject);
						int count = 0;
						System.Int32.TryParse (testerBugCountLabel.text, out count);
						count++;
						testerBugCountLabel.text = count.ToString ();
				}
		}
}
