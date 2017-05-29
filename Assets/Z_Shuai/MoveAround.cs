using UnityEngine;
using System.Collections;

public class MoveAround : MonoBehaviour {

    public Vector3 p1;
    public Vector3 p2;
    Vector3 target;
    public float speed;
    //public Vector3[] v3s;

    void Start () {
        target = p1;
        //v3s = new Vector3[2];
        //v3s[1] = p1;
        //v3s[2] = p2;
    }
	

	void Update () {
        if(Vector3.Distance(transform.position, target) <= 0.01f)
        {
            if(target == p1)
            {
                target = p2;
            }
            else
            {
                target = p1;
            }
        }
        transform.LookAt(target);
        transform.Translate(transform.forward * Time.deltaTime * speed);

    }
}
