﻿; ref http://git.oschina.net/linxinhong/VimDesktop/raw/master/Plugins/WizNote
;     /WizNote.ahk?dir=0&filepath=Plugins%2FWizNote%2FWizNote.ahk_class
;     &oid=60a9a6ecb68a3ae7ef6c5b5af540e84bc8139fc1
;     &sha=a78a6e18504e5bcecc5926e0176ed89bd661307a

WizNote:
    ; insert模式
    vim.mode("insert", "WizNoteMainFrame")

    vim.map("<esc>", "<Normal_Mode_WizNoteMainFrame>", "WizNoteMainFrame")

    ; normal模式
    vim.mode("normal", "WizNoteMainFrame")

    vim.map("i", "<Insert_Mode_WizNoteMainFrame>", "WizNoteMainFrame")
    
    vim.map("j", "<down>", "WizNoteMainFrame")
    vim.map("k", "<up>", "WizNoteMainFrame")
    vim.map("<shift>j", "<Wiz_NextNote>", "WizNoteMainFrame")
    vim.map("<shift>k", "<Wiz_PrevNote>", "WizNoteMainFrame")

    vim.map("h", "<left>", "WizNoteMainFrame")
    vim.map("l", "<right>", "WizNoteMainFrame")
    vim.map("gg", "<home>", "WizNoteMainFrame")
    vim.map("<shift>g", "<end>", "WizNoteMainFrame")

    vim.map("a", "<Wiz_NewNote>", "WizNoteMainFrame")
    vim.map("x", "<Wiz_Delete>", "WizNoteMainFrame")
    vim.map("e", "<Wiz_Edit>", "WizNoteMainFrame")
    vim.map("u", "<Wiz_CloseTab>", "WizNoteMainFrame")
    vim.map("t", "<Wiz_List>", "WizNoteMainFrame")

    ; 定义注释
    vim.comment("<Normal_Mode_WizNoteMainFrame>", "进入normal模式")
    vim.comment("<Insert_Mode_WizNoteMainFrame>", "进入insert模式")
    vim.comment("<Wiz_NewNote>", "新建笔记")
    vim.comment("<Wiz_NewDesktopNote>", "新建桌面便签")
    vim.comment("<Wiz_Delete>", "删除笔记")
    vim.comment("<Wiz_CopyOrMove>", "复制或移动笔记")
    vim.comment("<Wiz_Task>", "打开任务")
    vim.comment("<Wiz_FullScreen>", "全屏")
    vim.comment("<Wiz_Edit>", "编辑笔记")
    vim.comment("<Wiz_CloseTab>", "关闭当前标签")
    vim.comment("<Wiz_NextNote>", "下一个笔记")
    vim.comment("<Wiz_PrevNote>", "上一个笔记")
    vim.comment("<Wiz_List>", "定位到左侧目录")
return

; 对指定控件使用insert模式
WizNoteMainFrame_CheckMode()
{
    ControlGetFocus, ctrl, AHK_CLASS WizNoteMainFrame
    ; ATL:004ABB001 可能会变
    if RegExMatch(ctrl, "ATL:004ABB001")
        return true
    if RegExMatch(ctrl, "WebViewHost")
        return true
    return false
}

<Normal_Mode_WizNoteMainFrame>:
    vim.mode("normal", "WizNoteMainFrame")
return

<Insert_Mode_WizNoteMainFrame>:
    vim.mode("insert", "WizNoteMainFrame")
return

<Wiz_NewNote>:
    Send, ^n
return

<Wiz_NewDesktopNote>:
    Send, ^!d
return

<Wiz_Delete>:
    Send, {Del}
return

<Wiz_Task>:
    Send, ^!y
return

<Wiz_CopyOrMove>:
    Send, ^m
return

<Wiz_FullScreen>:
    Send, {F11}
return

<Wiz_Edit>:
    Send, ^e
return

<Wiz_CloseTab>:
    Send, ^w
return

<Wiz_List>:
    ControlFocus, WizListCtrl1
return

<Wiz_NextNote>:
    Gosub, <Wiz_List>
    Send, {down}
return

<Wiz_PrevNote>:
    Gosub, <Wiz_List>
    Send, {up}
return

/*
原始快捷键列表:

内容剪辑
Win+PrintScreen 捕捉屏幕到为知
Win+S 保存选中内容
Ctrl+Alt+V 保存剪贴板中内容

全局快捷键
Ctrl+Alt+N 快速新建笔记
Ctrl+Alt+M 打开为知笔记

笔记编辑
Ctrl+E 编辑/保存文档
Ctrl+W 关闭当前标签页
Ctrl+T 笔记选中部分作为标题
Ctrl+G 笔记选中部分作为标签
Alt+E 给当前笔记添加标签
Alt+F 给当前笔记添加附件
Alt+Q 显示当前笔记信息
Ctrl+O 插入清单
Ctrl+1/2... 将设为样式中的标题1/2...
Ctrl+Shift+O 插入或设为数字列表
Ctrl+Shift+U 插入或设为无序列表
ctrl + alt + ] 增大选中文字字体
ctrl + alt + [ 减小选中文字字体
Ctrl+B 笔记选中部分加粗
Ctrl+I 笔记选中部分变斜体
Ctrl+U 笔记选中部分加下划线
Ctrl+L 插入
Ctrl+; 插入当前系统日期或时间
Ctrl+Shift+; 设置插入的日期时间格式

为知界面
Ctrl+N 新建笔记
Ctrl+F 新建子文件夹
Esc 显示/隐藏左侧目录栏
F11 进入或退出全屏模式
Ctrl+Shift+TAB 切换标签页
F7 打开上一条笔记
F8 打开下一条笔记
F9 同步笔记
Ctrl+鼠标滚轮 放大或缩小笔记视图
Alt+D 设置键盘焦点到搜索框

桌面便笺和任务列表
Ctrl+Alt+D 新建桌面便笺
Ctrl+Alt+Y 打开默认任务列表
Ctrl+F3 打开所有任务列表

更多设置
若想更改部分快捷键，可在菜单——选项——热键、网页剪辑器选项卡中进行更多设置
*/
