using UnityEngine;

namespace LuaFramework
{
    public class ShortcutKeyDebugging : MonoBehaviour
    {
        void Update()
        {
            //快捷键打印
            if (Input.GetKeyDown(KeyCode.Q))
            {
                Util.CallMethod("Game", "TestQ");
            }

            else if (Input.GetKeyDown(KeyCode.W))
            {
                Util.CallMethod("Game", "TestW");
            }

            else if (Input.GetKeyDown(KeyCode.E))
            {
                Util.CallMethod("Game", "TestE");
            }

            else if (Input.GetKeyDown(KeyCode.R))
            {
                Util.CallMethod("Game", "TestR");
            }
        }
    }
}
