using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Stats))]
public class HitDamage : MonoBehaviour,IHitable {

	Stats stats; 
	public AnimationClip deathAnimation;
	public AudioClip deathClip;
	public AIFollow aiFollow;
	public UILabel developerBugCountLabel;
	
	// Use this for initialization
	void Start () {
		stats = GetComponent<Stats> ();
	}

	public void Hit ()
	{
				stats.Health -= 10;

				if (stats.Health == 0) {
						animation.CrossFade (deathAnimation.name);
						aiFollow.canMove = false;
						audio.PlayOneShot (deathClip);	

									int count = 0;
									System.Int32.TryParse (developerBugCountLabel.text, out count);
									count++;
									developerBugCountLabel.text = count.ToString ();
			Destroy (gameObject, 1);	

				}
		}
}
