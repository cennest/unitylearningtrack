using UnityEngine;
using System.Collections;

public class MoveAnimation : MonoBehaviour {

public GameObject player;
	Animation animation;
	private float BaseAnimationSpeed = 0.5f;
	private float AnimationSpeedModifier = 0.25f;

	// Use this for initialization
	void Start () {
	

		postTest ();
		getTest ();
		animation = GetComponent<Animation> ();

	}

	void postTest()
	{
		string url = "http://taskmanagerapp.azurewebsites.net/api/tasks/updateTaskDetails";
		
		WWWForm form = new WWWForm();
		form.AddField("TaskID", 1);
		form.AddField("TaskDescription", "Stalin Test");
		form.AddField("TaskStatus", "Open");
		form.AddField("TaskAssignTO", "nmbhor@cennest.com");
		form.AddField("UserID", 1);
		form.AddField("GroupID",1);
		WWW www = new WWW(url, form);
	
		StartCoroutine(WaitForRequest(www));
	}


	void getTest()
	{
		string url = "http://taskmanagerapp.azurewebsites.net/api/tasks/getAllTasks?groupId=1&userId=1";
		WWW www = new WWW(url);
		StartCoroutine(WaitForRequest(www));
	
	}

	IEnumerator WaitForRequest(WWW www)
	{
		yield return www;
		
		// check for errors
		if (www.error == null)
		{
			Debug.Log("WWW Ok!: " + www.data);
		} else {
			Debug.Log("WWW Error: "+ www.error);
		}
	}





	
	// Update is called once per frame
	void Update () {
	
		animation [animation.clip.name].speed = player.GetComponent<CharacterMotor> ().movement.velocity.magnitude * AnimationSpeedModifier + BaseAnimationSpeed;
	}
}
