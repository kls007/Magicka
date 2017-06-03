using UnityEngine;
using System.Collections;

public class CameraFollow : MonoBehaviour {

    Transform mainCamera;
    Transform target;
    Vector3 diff;
    public float followSpeed;
    
	void Awake () {
        mainCamera = GameObject.FindWithTag("MainCamera").transform;
        target = GameObject.FindWithTag("Player").transform;
        diff = mainCamera.position - target.position;
        
    }
	
	void LateUpdate()
    {
        Vector3 newPos = target.position + diff;
        mainCamera.position = Vector3.Lerp(mainCamera.position, newPos, Time.deltaTime * followSpeed);
    }
}
