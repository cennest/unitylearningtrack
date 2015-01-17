using UnityEngine;
using System.Collections;

public class HitPartices : MonoBehaviour,IHitable {

	public ParticleSystem particle;

	#region IHitable implementation

	public void Hit ()
	{
		particle.Play ();
	}

	#endregion



}
