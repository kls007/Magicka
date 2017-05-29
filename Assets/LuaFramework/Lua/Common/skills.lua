
SkillTool = {}

function SkillTool.Skill_Q()
    print_t('Skill_Q', 'SkillTool')

    SkillTool.Attack1()
end

function SkillTool.Skill_W()
    print_t('Skill_W', 'SkillTool')
    
    SkillTool.ChangeWeapon()
end

function SkillTool.Skill_E()
    print_t('Skill_E', 'SkillTool')

end

function SkillTool.Skill_R()
    print_t('Skill_R', 'SkillTool')

    SkillTool.Idle_1()
end

function SkillTool.Skill_A()
    print_t('Skill_A', 'SkillTool')

    SkillTool.RunCycle()
end

function SkillTool.Skill_S()
    print_t('Skill_S', 'SkillTool')
end

function SkillTool.Skill_D()
    print_t('Skill_D', 'SkillTool')
end

function SkillTool.Skill_F()
    print_t('Skill_F', 'SkillTool')


end

function SkillTool.Skill_Left()
    print_t('Skill_Left', 'SkillTool')


    local pre = UnityEngine.Resources.Load("Prefabs/E/Stone_3")
    go1 = GameObject.Instantiate(pre)
    go1.transform.position = Vector3.New(-4,4,0)
    go2  = GameObject.Instantiate(pre)
    go2.transform.position = Vector3.New(4,4,0)
    go3 = GameObject.Instantiate(pre)
    go3.transform.position = Vector3.New(0,4,-4)
    go4  = GameObject.Instantiate(pre)
    go4.transform.position = Vector3.New(0,4,4)

    local yDir = Vector3.up
    local function test1()
        -- math.randomseed(os.time())
        -- local randomX = math.random(0, 10000)
        -- local randomY = math.random(0, 10000)
        -- local randomZ = math.random(0, 10000)
        local dir = Vector3.up --Vector3.New(randomX, randomY, randomZ)

        go1.transform:RotateAround(Player.transform.position, dir, 4)
        go2.transform:RotateAround(Player.transform.position, dir, 4)
        go3.transform:RotateAround(Player.transform.position, dir, 4)
        go4.transform:RotateAround(Player.transform.position, dir, 4)
        -- myJingling.transform:Translate(yDir * 0.001)
        -- if myJingling.transform.position.y > -6 or myJingling.transform.position.y < 6 then
        --     yDir = -yDir
        -- end

    end

    timer111 = Timer.New(test1, 0.01, -1, 1)
    timer111:Start()
end

function SkillTool.Skill_Middle()
    print_t('Skill_Middle', 'SkillTool')

    SkillTool.ResetToCenterPos()
end

function SkillTool.Skill_Right()
    print_t('Skill_Right', 'SkillTool')

    SkillTool.TeleportForward(20)
end

------------------------------------------------------------------------------------------
--空闲--
function SkillTool.Idle_1()
    local ani = Player.gameObject:GetComponent("Animation")
    ani:Play('Idle_1')
end

--跑--
function SkillTool.RunCycle()
    local ani = Player.gameObject:GetComponent("Animation")
    ani:Play('RunCycle')
end

--攻击--
function SkillTool.Attack1()
    local player_ac = Player.gameObject:GetComponent("Animator")
    player_ac:SetTrigger("attack")

    local shootPlace = Player.transform:FindChild('Bip01/Bip01 Pelvis/Bip01 Spine/Bip01 Spine1/Bip01 Neck/Bip01 R Clavicle/Bip01 R UpperArm/Bip01 R Forearm/Bip01 R Hand/Bip01 R Finger0')
    print_t(shootPlace, 'shootPlace')

    local pre = UnityEngine.Resources.Load("Prefabs/E/Stone_3")
    local go = GameObject.Instantiate(pre, Vector3.New(shootPlace.transform.position.x, 1, shootPlace.transform.position.z), pre.transform.rotation)
    go:GetComponent("Rigidbody"):AddForce(Player.transform.forward * 600)


end

--丢石头--
function SkillTool.PushStone()
    
end

--向前闪现--
function SkillTool.TeleportForward(distance)
    player_old_position = Player.transform.position
    Player.transform.position = Player.transform.position + Player.transform.forward * distance
    -- SkillTool.Attack1()

    local explode_prefab_start = UnityEngine.Resources.Load("Effects/KY_effects/MagicEffectsPackFree/prefab/WhityBomb")
    local explode_prefab_end = UnityEngine.Resources.Load("Effects/DL_Fantasy_RPG_Effects/prefab/explode1") 
    local startLifetime_start = explode_prefab_start.gameObject:GetComponent("ParticleSystem").startLifetime
    local startLifetime_end = explode_prefab_end.gameObject:GetComponent("ParticleSystem").startLifetime
    local explode_go_start = GameObject.Instantiate(explode_prefab_start, Vector3.New(player_old_position.x, 1, player_old_position.z), explode_prefab_start.transform.rotation)
    explode_go_start.transform.parent = Container3D.transform
    local explode_go_end = nil
    explode_go_end = GameObject.Instantiate(explode_prefab_end, Vector3.New(Player.transform.position.x, 1, Player.transform.position.z), explode_prefab_end.transform.rotation)
    explode_go_end.transform.parent = Container3D.transform

    local timer3 = Timer.New(function( ... )
        GameObject.Destroy(explode_go_start)
        GameObject.Destroy(explode_go_end)
    end, startLifetime_start + startLifetime_end + 0.4, 1, 1)
    timer3:Start()
end

--随机瞬移--
function SkillTool.TeleportRandom(target)
    math.randomseed(os.time())
    math.random(1,100000)
    local randomX = math.random(-40, 40)
    local randomZ = math.random(-40, 40)
    local oldPos = Player.transform.position
    Player.transform.position = Vector3.New(oldPos.x + randomX, oldPos.y, oldPos.z + randomZ)
end

--回到中心点--
function SkillTool.ResetToCenterPos(target)
    local centerPos = Vector3.New(0, 0, 0)
    Player.transform.position = centerPos
end

--换武器--
function SkillTool.ChangeWeapon()
    local righthand = Player.transform:FindChild('Bip01/Bip01 Pelvis/Bip01 Spine/Bip01 Spine1/Bip01 Neck/Bip01 R Clavicle/Bip01 R UpperArm/Bip01 R Forearm/Bip01 R Hand/Bone01')
    local currentIndex = 0
    local newIndex = 0

    local weapon_table = {}
    for i = 1, righthand.transform.childCount, 1 do
        local weapon = righthand.transform:GetChild(i - 1).gameObject
        if weapon.gameObject.activeInHierarchy == true then
            currentIndex = i
        end
        table.insert(weapon_table, weapon)
        weapon:SetActive(false)
    end

    if currentIndex >= #weapon_table then
        newIndex = 1
    else
        newIndex = currentIndex + 1
    end
    weapon_table[newIndex]:SetActive(true)
end

--升级--
function SkillTool.AddLevel()
    local data = Get_M2Data()
    data.User.level = data.User.level + 1
    Set_M2Data(data)

    Event.Brocast('level_change', '朱文海', '大傻逼' , '超級大')
end