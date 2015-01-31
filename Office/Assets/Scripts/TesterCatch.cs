using UnityEngine;
using System.Collections;

public class TesterCatch : MonoBehaviour {

	public AIFollow aiFollow;
	public GameObject bug;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
		Transform[] ts = bug.GetComponentsInChildren<Transform>();

		foreach (Transform t in ts) {
						if (t != null && t.gameObject.activeInHierarchy)
								aiFollow.target = t;		
				}

		if (ts.Length == 1) {
				
			Application.LoadLevel("GameOver");
		}
	}
}
