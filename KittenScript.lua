    --[[
        Developer: @volalume
        Original Developer: @icedoomfist / https://github.com/IceDoomfist
        MEOW
    ]]--
    --[[
    V5-a 변경사항:
        (1.70-b.3411 업데이트 무시)
        Added -> 오프닝 크레딧 일부 수정
        Fixed -> Limit 디버그 텍스트 표시가 작동하지 않던 오류 해결
    ]]--
--------

main_var = {
    SCRIPT_NAME = "Kitten",
    SCRIPT_VER = "5-a",

    delay_Type = 1,
    delay_sec = {
        delay_1 = 500,
        delay_2 = 11500
    },

    orbital_flag = {
        waiting_500 = false,
        waiting_11500 = false,
        turn_down = false
    },

    loop_flag = {
        is_loop_running = false,
        is_autoskip_running = false,
        is_debugtext_on = true
    },

    transaction_error_flag = { -- thx for jinx
        util.joaat("CTALERT_F"),
        util.joaat("CTALERT_F_1"),
        util.joaat("CTALERT_F_2"),
        util.joaat("CTALERT_F_3"),
        util.joaat("CTALERT_F_4"),
    },

    limit_flag = {
        limit_selection = 50000000,
        got = 0,
        is_limit = true,
    },

    fast_change = {
        rp_selection = 120
    },
}

labels = {
    main_root = "메뉴",
        
    Money_labels = {
        money_div = "돈기능",

        money_tab = "돈기능",
        instant_tab = "Instant Money",
        safe_tab = "Safe Money",
        custom_tab = "Custom Money",

        orbital_menu = "[안전] 오비탈메소드",
        orbital_desc = "가장 느리지만 가장 안전하고 안정적인 방법, 제한되지 않음!! nflag_500: 지연1, flag_11500: 지연4",

        ez680k_menu = "[위험] 68만 루프",
        ez180k_menu = "[위험] 18만 루프",
        ez50k_menu = "[위험] 5만 루프",
        ez_desc = "표준 방법이지만 제한",
    },

    Misc_labels = {
        misc_tab = "기타",

        misc_div = "기타",

        trans_atskp_menu = "트랜잭션 오류 자동 건너뛰기",
        trans_atskp_desc = "오류를 방지하지는 않지만 징크스 덕분에 오류 화면을 자동으로 건너뜁니다.",

        fast_unlock = "올언락",
        fast_unlock_desc = "완료!",

        fast_change_rp_div = "랭크설정",

        fast_rp_sel_name = "랭크: ",
        fast_rp_sel_desc = "완료!",
        fast_do_rp = "랭크변경",
        fast_do_rp_desc = "최대: 8,000",
        fast_do_rep = "LS 랭크변경",
        fast_do_rep_desc = "최대: 1,000",

        limit_div = "돈제한",
        
        limit_sel = "돈제한: ",
        limit_sel_de = "기본: $50,000m",

        reset_earn = "돈제한 리셋",
        
        limit_enable = "사용",
        limit_enable_desc = "설정한 양에 도달하면 루프가 자동으로 꺼집니다."
    },

    Setting_labels = {
        setting_tab = "세팅",
        
        delay_select_div = "Delay Selection",

        delay_type = "지연 선택",
        delay_type_desc = "머니 루프에 대한 지연 방법 선택\n\n시간: 표준 방법\n바스켓 감지: 자동 지연 시스템\n빠른: 요리",
        delay_type_Time = "시간",
        delay_type_BasketDetection = "바스켓 감지",
        delay_type_Rapid = "빠른",
        new_delay_type_Time = "새 지연 유형: 시간",
        new_delay_type_BasketDetection = "새 지연 유형: 바스켓 감지(이 방법은 r*에 의해 패치됨)",
        new_delay_type_Rapid = "새로운 지연 유형: 신속",

        delay_set_tab = "지연 설정",
        delay_set_div = "지연 설정",

        delay_custom_select_1 = "지연1을 선택합니다: ",
        delay_custom_select_1_desc = "기본: 500ms",
        delay_custom_select_2 = "지연2을 선택합니다: ",
        delay_custom_select_2_desc = "기본: 1000ms",
        delay_custom_select_3 = "지연3을 선택합니다: ",
        delay_custom_select_3_desc = "기본: 10000ms", 
        delay_custom_select_4 = "지연4을 선택합니다: ",
        delay_custom_select_4_desc = "기본: 11500ms", 
        
        overlay_div = "Watermark Setting",

        dbgtext_menu = "디버그 텍스트",
        dbgtext_desc = "디버그 텍스트 표시"
    },

    Watermark_label = {
        none = "",
        name = "Kitten Script 한국어".." v"..main_var.SCRIPT_VER,
        credit = "@volalume @icedoomfist @stungeon",
        github_dir = "~y~https://github.com/Volalume/Stand-Kitten-Script",

        orbital_wlf = {
            flag_500 = "오비탈_flag: 대기-지연_1",
            flag_11500 = "오비탈_flag: 대기-지연_2",
            flag_turndown = "오비탈_flag: 거절하기",
            flag_none = "오비탈_flag: 실행되지 않음"
        },

        loop_wlf = {
            running_name = "",
            nothing_is_running = "실행 중인 것이 없습니다",

            loop_flag_end_text = " 실행 중",

            autoskip_on = "에러자동 스킵: 켜짐",
            autoskip_off = "에러자동 스킵: 꺼짐"
        },   
        
       limit_wlf = {
            limited_earn = "목표금액: "..main_var.limit_flag.limit_selection,
            your_earned = "추가된돈: "..main_var.limit_flag.got,
            is_limit_wlf = "돈제한: "..main_var.limit_flag.is_limit
        },  
    },

    Flag_label = {
        done = "끝"
    },
}

global_var = {
    
    instant = {
        ezmoney = 4537945, --3407
        orbital = 1962995, --3407
        chips = 1963515, --outdated (shit)
    },

    ezmoney_hash = {
        category = 1474183246,

        bet = 2896648878,
        obj = 0x615762F1,
        tiunk = 0x610F9AB4
    },

    safe_loop = {
        nightclub_safe = 262145, --outdated (detected?)
    }
}

util.create_tick_handler(function() -- refresh limit var
    labels.Watermark_label.limit_wlf.limited_earn = "목표금액: "..main_var.limit_flag.limit_selection
    labels.Watermark_label.limit_wlf.your_earned = "추가된돈: "..main_var.limit_flag.got
    labels.Watermark_label.limit_wlf.is_limit_wlf = "돈제한: "..main_var.limit_flag.is_limit
end)
---

util.require_natives(1681379138)

function set_global_i(global, value)
    memory.write_int(memory.script_global(global), value)
end

function set_stat_i(stat, value)
    STATS.STAT_SET_INT(util.joaat(ADD_MP_INDEX(stat)), value, true)
end

function add_mp_index(stat)
    local Exceptions = {
        "MP_CHAR_STAT_RALLY_ANIM",
        "MP_CHAR_ARMOUR_1_COUNT",
        "MP_CHAR_ARMOUR_2_COUNT",
        "MP_CHAR_ARMOUR_3_COUNT",
        "MP_CHAR_ARMOUR_4_COUNT",
        "MP_CHAR_ARMOUR_5_COUNT",
    }
    for _, exception in pairs(Exceptions) do
        if stat == exception then
            return "MP" .. util.get_char_slot() .. "_" .. stat
        end
    end

    if not string.contains(stat, "MP_") and not string.contains(stat, "MPPLY_") then
        return "MP" .. util.get_char_slot() .. "_" .. stat
    end
    return stat
end

function tp_coords(x, y, z)
    PED.SET_PED_COORDS_KEEP_toggle_loop1EHICLE(players.user_ped(), x, y, z)
end

function do_ezmoney(hash, amount)
    set_global_i(global_var.instant.ezmoney + 1, 2147483646)
    set_global_i(global_var.instant.ezmoney + 7, 2147483647)
    set_global_i(global_var.instant.ezmoney + 6, 0)
    set_global_i(global_var.instant.ezmoney + 5, 0)
    set_global_i(global_var.instant.ezmoney + 3, hash)
    set_global_i(global_var.instant.ezmoney + 2, amount)
    set_global_i(global_var.instant.ezmoney, 2)
end


menu.divider(menu.my_root(), labels.main_root)

---#Menu
Money = menu.list(menu.my_root(), labels.Money_labels.money_tab, {"makemoney"}, "", function(); end)

Misc = menu.list(menu.my_root(), labels.Misc_labels.misc_tab, {"misc"}, "", function(); end)

Setting = menu.list(menu.my_root(), labels.Setting_labels.setting_tab, {"setting"}, "", function(); end)
--Delay = menu.list(Setting, "Delay Setting", {"delaysetting"}, "", function(); end) / Line 133

---#Instant Money
menu.toggle_loop(Money, labels.Money_labels.orbital_menu, {"orbtloop"}, labels.Money_labels.orbital_desc, function() --TODO: Fixed on V3
    main_var.loop_flag.is_loop_running = true
    labels.Watermark_label.loop_wlf.running_name = labels.Money_labels.orbital_menu

    if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
        util.toast(labels.Flag_label.done)
        menu.trigger_commands("orbtloop off")
    else
        set_global_i(global_var.instant.orbital, 1)
    end
    main_var.orbital_flag.waiting_500 = true
    util.yield(main_var.delay_sec.delay_1)
    main_var.orbital_flag.waiting_500 = false

    if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
        util.toast(labels.Flag_label.done)
        menu.trigger_commands("orbtloop off")
    else
        set_global_i(global_var.instant.orbital, 0)
        main_var.limit_flag.got = main_var.limit_flag.got + 500000
    end
    main_var.orbital_flag.waiting_11500 = true;
    util.yield(main_var.delay_sec.delay_2)
    main_var.orbital_flag.waiting_11500 = false;

    if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
        util.toast(labels.Flag_label.done)
        menu.trigger_commands("orbtloop off")
    else
        set_global_i(global_var.instant.orbital, 2)
    end
    main_var.orbital_flag.waiting_500 = true
    util.yield(main_var.delay_sec.delay_1)
    main_var.orbital_flag.waiting_500 = false

    if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
        util.toast(labels.Flag_label.done)
        menu.trigger_commands("orbtloop off")
    else
        set_global_i(global_var.instant.orbital, 0)
        main_var.limit_flag.got = main_var.limit_flag.got + 750000
    end
    main_var.orbital_flag.waiting_11500 = true;
    util.yield(main_var.delay_sec.delay_2)
end, function()
    main_var.orbital_flag.waiting_500 = false
    main_var.orbital_flag.waiting_11500 = false;
    main_var.orbital_flag.turn_down = true;

    main_var.loop_flag.is_loop_running = false;
    labels.Watermark_label.loop_wlf.running_name = ""

    do_ezmoney(global_var.ezmoney_hash.tiunk, 0)
end)

menu.toggle_loop(Money, labels.Money_labels.ez680k_menu, {"680kloop"}, labels.Money_labels.ez_desc, function()
    main_var.loop_flag.is_loop_running = true
    labels.Watermark_label.loop_wlf.running_name = labels.Money_labels.ez680k_menu

    price = NETSHOPPING.NET_GAMESERVER_GET_PRICE(global_var.ezmoney_hash.bet, global_var.ezmoney_hash.category, true)
    if main_var.delay_Type == 1 then
        if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
            util.toast(labels.Flag_label.done)
            menu.trigger_commands("680kloop off")
        else
            do_ezmoney(global_var.ezmoney_hash.bet, price)
            main_var.limit_flag.got = main_var.limit_flag.got + price
        end
        util.yield(main_var.delay_sec.delay_1)
    elseif main_var.delay_Type == 2 then
        if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
            util.toast(labels.Flag_label.done)
            menu.trigger_commands("680kloop off")
        else
            do_ezmoney(global_var.ezmoney_hash.bet, price)
            main_var.limit_flag.got = main_var.limit_flag.got + price
        end
        util.yield(main_var.delay_sec.delay_1)
    else
        if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
            util.toast(labels.Flag_label.done)
            menu.trigger_commands("680kloop off")
        else
            do_ezmoney(global_var.ezmoney_hash.bet, price)
            main_var.limit_flag.got = main_var.limit_flag.got + price
        end
    end
end, function()
    main_var.loop_flag.is_loop_running = false;
    labels.Watermark_label.loop_wlf.running_name = ""
    do_ezmoney(global_var.ezmoney_hash.tiunk, 0)
end)

menu.toggle_loop(Money, labels.Money_labels.ez180k_menu, {"180kloop"}, labels.Money_labels.ez_desc, function()
    main_var.loop_flag.is_loop_running = true
    labels.Watermark_label.loop_wlf.running_name = labels.Money_labels.ez180k_menu

    price = NETSHOPPING.NET_GAMESERVER_GET_PRICE(global_var.ezmoney_hash.obj, global_var.ezmoney_hash.category, true)
    if main_var.delay_Type == 1 then
        if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
            util.toast(labels.Flag_label.done)
            menu.trigger_commands("180kloop off")
        else
            do_ezmoney(global_var.ezmoney_hash.obj, price)
            main_var.limit_flag.got = main_var.limit_flag.got + price
        end
        util.yield(main_var.delay_sec.delay_1)
    elseif main_var.delay_Type == 2 then
        if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
            util.toast(labels.Flag_label.done)
            menu.trigger_commands("180kloop off")
        else
            do_ezmoney(global_var.ezmoney_hash.obj, price)
            main_var.limit_flag.got = main_var.limit_flag.got + price
        end
        util.yield(main_var.delay_sec.delay_1)
    else
        if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
            util.toast(labels.Flag_label.done)
            menu.trigger_commands("180kloop off")
        else
            do_ezmoney(global_var.ezmoney_hash.obj, price)
            main_var.limit_flag.got = main_var.limit_flag.got + price
        end
    end
end, function()
    main_var.loop_flag.is_loop_running = false;
    labels.Watermark_label.loop_wlf.running_name = ""
    do_ezmoney(global_var.ezmoney_hash.tiunk, 0)
end)

menu.toggle_loop(Money, labels.Money_labels.ez50k_menu, {"50kloop"}, labels.Money_labels.ez_desc, function()
    main_var.loop_flag.is_loop_running = true
    labels.Watermark_label.loop_wlf.running_name = labels.Money_labels.ez50k_menu

    price = NETSHOPPING.NET_GAMESERVER_GET_PRICE(global_var.ezmoney_hash.tiunk, global_var.ezmoney_hash.category, true)
    if main_var.delay_Type == 1 then
        if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
            util.toast(labels.Flag_label.done)
            menu.trigger_commands("50kloop off")
        else
            do_ezmoney(global_var.ezmoney_hash.tiunk, price)
            main_var.limit_flag.got = main_var.limit_flag.got + price
            util.toast(main_var.limit_flag.got)
        end
        util.yield(main_var.delay_sec.delay_1)
    elseif main_var.delay_Type == 2 then
        if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
            util.toast(labels.Flag_label.done)
            menu.trigger_commands("50kloop off")
        else
            do_ezmoney(global_var.ezmoney_hash.tiunk, price)
            main_var.limit_flag.got = main_var.limit_flag.got + price
        end
        util.yield(main_var.delay_sec.delay_1)
    else
        if(main_var.limit_flag.got >= main_var.limit_flag.limit_selection) then
            util.toast(labels.Flag_label.done)
            menu.trigger_commands("50kloop off")
        else
            do_ezmoney(global_var.ezmoney_hash.tiunk, price)
            main_var.limit_flag.got = main_var.limit_flag.got + price
        end
    end
end, function()
    main_var.loop_flag.is_loop_running = false;
    labels.Watermark_label.loop_wlf.running_name = ""
    do_ezmoney(global_var.ezmoney_hash.tiunk, 0)
end)

---#Safe Money


---#Misc
menu.divider(Misc, labels.Misc_labels.misc_div)

menu.toggle_loop(Misc, labels.Misc_labels.trans_atskp_menu, {"autoskiptans"}, labels.Misc_labels.trans_atskp_desc, function() --thx for jinx
    main_var.loop_flag.is_autoskip_running = true
    local msgHash = HUD.GET_WARNING_SCREEN_MESSAGE_HASH()
    for i, hash in ipairs(main_var.transaction_error_flag) do
        if msgHash == hash then
            PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1.0)
            util.yield()
        end
    end
    util.yield()
end, function()
    main_var.loop_flag.is_autoskip_running = false
end)

menu.action(Misc, labels.Misc_labels.fast_unlock, {"fastunlockall"}, labels.Misc_labels.fast_unlock_desc, function()
    menu.trigger_commands("unlockall")
    menu.trigger_commands("unlockprizeride")
end)

menu.divider(Misc, labels.Misc_labels.fast_change_rp_div)

fast_rp_selection = menu.slider(Misc, labels.Misc_labels.fast_rp_sel_name, {"selectfastrp"}, labels.Misc_labels.fast_rp_sel_desc, 0, 8000, 120, 1, function()
    main_var.fast_change.rp_selection = menu.get_value(fast_rp_selection)
end)

menu.action(Misc, labels.Misc_labels.fast_do_rp, {"fastchangerp"}, labels.Misc_labels.fast_do_rp_desc, function()
    menu.trigger_commands("setrank "..main_var.fast_change.rp_selection)
    util.yield(100)
    menu.trigger_commands("go solo")
end)

menu.action(Misc, labels.Misc_labels.fast_do_rep, {"fastchangels"}, labels.Misc_labels.fast_do_rep_desc, function()
    menu.trigger_commands("setlscarmeetreplevel "..main_var.fast_change.rp_selection)
end)

menu.divider(Misc, labels.Misc_labels.limit_div)

earn_limiter = menu.slider(Misc, labels.Misc_labels.limit_sel, {"selectearnlimit"}, labels.Misc_labels.limit_sel_de, 0, 2147483647, 50000000, 1000000, function()
    main_var.limit_flag.limit_selection = menu.get_value(earn_limiter)
end)

menu.action(Misc, labels.Misc_labels.reset_earn, {"resetearned"}, "", function()
    main_var.limit_flag.got = 0
end)

menu.toggle(Misc, labels.Misc_labels.limit_enable, {"earn limit"}, labels.Misc_labels.limit_enable_desc, function(on)
    main_var.limit_flag.is_limit = on
end, true)

---#Setting
menu.divider(Setting, labels.Setting_labels.delay_select_div)

menu.textslider_stateful(Setting, labels.Setting_labels.delay_type, {}, labels.Setting_labels.delay_type_desc, {
labels.Setting_labels.delay_type_Time,
labels.Setting_labels.delay_type_BasketDetection,
labels.Setting_labels.delay_type_Rapid,
}, function(index)
    if index == 1 then
        util.toast(labels.Setting_labels.new_delay_type_Time)
        main_var.delay_Type = 1
    elseif  index == 2 then
        util.toast(labels.Setting_labels.new_delay_type_BasketDetection)
        main_var.delay_Type = 2
    else
        util.toast(labels.Setting_labels.new_delay_type_Rapid)
        main_var.delay_Type = 3
    end
end)

Delay = menu.list(Setting, labels.Setting_labels.delay_set_tab, {"delaysetting"}, "", function(); end)

menu.divider(Delay, labels.Setting_labels.delay_set_div)

delay_1_selection = menu.slider(Delay, labels.Setting_labels.delay_custom_select_1, {"selectdelay1"}, labels.Setting_labels.delay_custom_select_1_desc, 0, 100000, 500, 50, function()
    --util.toast("New Delay 1: " ..main_var.delay_sec.delay_1)
    main_var.delay_sec.delay_1 = menu.get_value(delay_1_selection)
end)

delay_2_selection = menu.slider(Delay, labels.Setting_labels.delay_custom_select_4, {"selectdelay4"}, labels.Setting_labels.delay_custom_select_3_desc, 0, 100000000, 11500, 500, function()
    --util.toast("New Delay 3: " ..main_var.delay_sec.delay_3)
    main_var.delay_sec.delay_2 = menu.get_value(delay_2_selection)
end)

menu.divider(Setting, labels.Setting_labels.overlay_div)

menu.toggle(Setting, labels.Setting_labels.dbgtext_menu, {"dbgtext"}, labels.Setting_labels.dbgtext_desc, function(on)
    main_var.loop_flag.is_debugtext_on = on
end, true)

---#ends

util.show_corner_help(labels.Watermark_label.credit)
util.yield(1000)
util.show_corner_help(labels.Watermark_label.name)
util.yield(1000)
util.show_corner_help(labels.Watermark_label.github_dir)

util.create_tick_handler(function()
    util.draw_debug_text(labels.Watermark_label.none)
    util.draw_debug_text(labels.Watermark_label.name)
    util.draw_debug_text(labels.Watermark_label.credit)
    util.draw_debug_text(labels.Watermark_label.none)
    
    if main_var.loop_flag.is_debugtext_on then
        if main_var.orbital_flag.waiting_500 then
            util.draw_debug_text(labels.Watermark_label.orbital_wlf.flag_500)
        elseif main_var.orbital_flag.waiting_11500 then
            util.draw_debug_text(labels.Watermark_label.orbital_wlf.flag_11500)
        elseif main_var.orbital_flag.turn_down then
            util.draw_debug_text(labels.Watermark_label.orbital_wlf.flag_turndown)
        else
            util.draw_debug_text(labels.Watermark_label.orbital_wlf.flag_none)
        end
    
        if main_var.loop_flag.is_loop_running then
            util.draw_debug_text(labels.Watermark_label.loop_wlf.running_name..labels.Watermark_label.loop_wlf.loop_flag_end_text)
        else
            util.draw_debug_text(labels.Watermark_label.loop_wlf.nothing_is_running)
        end
    
        if main_var.loop_flag.is_autoskip_running then
            util.draw_debug_text(labels.Watermark_label.loop_wlf.autoskip_on)
        else
            util.draw_debug_text(labels.Watermark_label.loop_wlf.autoskip_off)
        end

        util.draw_debug_text(labels.Watermark_label.none)

        util.draw_debug_text(labels.Watermark_label.limit_wlf.limited_earn)
        util.draw_debug_text(labels.Watermark_label.limit_wlf.your_earned)
        util.draw_debug_text(labels.Watermark_label.limit_wlf.is_limit_wlf)

        util.draw_debug_text(labels.Watermark_label.none)
    end
end)

