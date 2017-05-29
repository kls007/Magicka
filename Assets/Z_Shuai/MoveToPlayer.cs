using UnityEngine;
using System.Collections;

public class MoveToPlayer : MonoBehaviour {

    GameObject player;

    //将自动寻路的目标设置为玩家所在位置

    void Awake()
    {
        player = GameObject.FindGameObjectWithTag("Player");
        GetComponent<NavMeshAgent>().destination = player.transform.position;
    }
    
    void Start () {
        
    }
	
	
}
