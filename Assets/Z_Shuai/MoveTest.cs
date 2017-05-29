using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveTest : MonoBehaviour {


    public GameObject target;
    public float speedX;
    public float speedZ;
    void Awake () {
        target = GameObject.FindWithTag("Player");
	}
	

}
