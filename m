Content-Type: multipart/mixed; boundary="===============2119535253375016561=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/t7xx/t7xx_state_monitor.c:67:7: warning: Uninitialized variables: notifier_cur.entry, notifier_cur.notifier_fn, notifier_cur.data [uninitvar]
Date: Sun, 21 Aug 2022 14:09:57 +0800
Message-ID: <202208211451.jAPlhtNc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2119535253375016561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/wwan/t7xx/t7xx_state_monitor.c:67:7: warning: Uninitialized variables: n=
otifier_cur.entry, notifier_cur.notifier_fn, notifier_cur.data [uninitvar]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: Loic Poulain <loic.poulain@linaro.org>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15b3f48a4339e3c16acf18624e2b7f60bc5e9a2c
commit: 13e920d93e37fcaef4a9309515798a3cae9dcf19 net: wwan: t7xx: Add core =
components
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 13e920d93e37fcaef4a9309515798a3cae9dcf19
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:67:7: warning: Uninitialized =
variables: notifier_cur.entry, notifier_cur.notifier_fn, notifier_cur.data =
[uninitvar]
     if (notifier_cur =3D=3D notifier)
         ^
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:82:17: warning: Uninitialized=
 variable: notifier->notifier_fn [uninitvar]
     if (notifier->notifier_fn)
                   ^
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:123:27: warning: Uninitialize=
d variables: cmd.flag, cmd.done, cmd.ret [uninitvar]
     fsm_finish_command(ctl, cmd, -EINVAL);
                             ^
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:130:20: warning: Uninitialize=
d variables: event.entry, event.length [uninitvar]
     fsm_del_kf_event(event);
                      ^
>> drivers/net/wwan/t7xx/t7xx_state_monitor.c:455:14: warning: Uninitialize=
d variable: event->event_id [uninitvar]
     if (event->event_id =3D=3D event_id)
                ^
--
>> drivers/net/wwan/t7xx/t7xx_hif_cldma.c:370:16: warning: Uninitialized va=
riable: req_cur->mapped_buff [uninitvar]
     if (req_cur->mapped_buff && req_cur->skb) {
                  ^
>> drivers/net/wwan/t7xx/t7xx_hif_cldma.c:786:12: warning: Uninitialized va=
riable: req->skb [uninitvar]
     if (req->skb) {
              ^

vim +67 drivers/net/wwan/t7xx/t7xx_state_monitor.c

13e920d93e37fc Haijun Liu 2022-05-06   58  =

13e920d93e37fc Haijun Liu 2022-05-06   59  void t7xx_fsm_notifier_unregiste=
r(struct t7xx_modem *md, struct t7xx_fsm_notifier *notifier)
13e920d93e37fc Haijun Liu 2022-05-06   60  {
13e920d93e37fc Haijun Liu 2022-05-06   61  	struct t7xx_fsm_notifier *notif=
ier_cur, *notifier_next;
13e920d93e37fc Haijun Liu 2022-05-06   62  	struct t7xx_fsm_ctl *ctl =3D md=
->fsm_ctl;
13e920d93e37fc Haijun Liu 2022-05-06   63  	unsigned long flags;
13e920d93e37fc Haijun Liu 2022-05-06   64  =

13e920d93e37fc Haijun Liu 2022-05-06   65  	spin_lock_irqsave(&ctl->notifie=
r_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   66  	list_for_each_entry_safe(notifi=
er_cur, notifier_next, &ctl->notifier_list, entry) {
13e920d93e37fc Haijun Liu 2022-05-06  @67  		if (notifier_cur =3D=3D notifi=
er)
13e920d93e37fc Haijun Liu 2022-05-06   68  			list_del(&notifier->entry);
13e920d93e37fc Haijun Liu 2022-05-06   69  	}
13e920d93e37fc Haijun Liu 2022-05-06   70  	spin_unlock_irqrestore(&ctl->no=
tifier_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   71  }
13e920d93e37fc Haijun Liu 2022-05-06   72  =

13e920d93e37fc Haijun Liu 2022-05-06   73  static void fsm_state_notify(str=
uct t7xx_modem *md, enum md_state state)
13e920d93e37fc Haijun Liu 2022-05-06   74  {
13e920d93e37fc Haijun Liu 2022-05-06   75  	struct t7xx_fsm_ctl *ctl =3D md=
->fsm_ctl;
13e920d93e37fc Haijun Liu 2022-05-06   76  	struct t7xx_fsm_notifier *notif=
ier;
13e920d93e37fc Haijun Liu 2022-05-06   77  	unsigned long flags;
13e920d93e37fc Haijun Liu 2022-05-06   78  =

13e920d93e37fc Haijun Liu 2022-05-06   79  	spin_lock_irqsave(&ctl->notifie=
r_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   80  	list_for_each_entry(notifier, &=
ctl->notifier_list, entry) {
13e920d93e37fc Haijun Liu 2022-05-06   81  		spin_unlock_irqrestore(&ctl->n=
otifier_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  @82  		if (notifier->notifier_fn)
13e920d93e37fc Haijun Liu 2022-05-06   83  			notifier->notifier_fn(state, =
notifier->data);
13e920d93e37fc Haijun Liu 2022-05-06   84  =

13e920d93e37fc Haijun Liu 2022-05-06   85  		spin_lock_irqsave(&ctl->notifi=
er_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   86  	}
13e920d93e37fc Haijun Liu 2022-05-06   87  	spin_unlock_irqrestore(&ctl->no=
tifier_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06   88  }
13e920d93e37fc Haijun Liu 2022-05-06   89  =

13e920d93e37fc Haijun Liu 2022-05-06   90  void t7xx_fsm_broadcast_state(st=
ruct t7xx_fsm_ctl *ctl, enum md_state state)
13e920d93e37fc Haijun Liu 2022-05-06   91  {
13e920d93e37fc Haijun Liu 2022-05-06   92  	ctl->md_state =3D state;
13e920d93e37fc Haijun Liu 2022-05-06   93  	fsm_state_notify(ctl->md, state=
);
13e920d93e37fc Haijun Liu 2022-05-06   94  }
13e920d93e37fc Haijun Liu 2022-05-06   95  =

13e920d93e37fc Haijun Liu 2022-05-06   96  static void fsm_finish_command(s=
truct t7xx_fsm_ctl *ctl, struct t7xx_fsm_command *cmd, int result)
13e920d93e37fc Haijun Liu 2022-05-06   97  {
13e920d93e37fc Haijun Liu 2022-05-06   98  	if (cmd->flag & FSM_CMD_FLAG_WA=
IT_FOR_COMPLETION) {
13e920d93e37fc Haijun Liu 2022-05-06   99  		*cmd->ret =3D result;
13e920d93e37fc Haijun Liu 2022-05-06  100  		complete_all(cmd->done);
13e920d93e37fc Haijun Liu 2022-05-06  101  	}
13e920d93e37fc Haijun Liu 2022-05-06  102  =

13e920d93e37fc Haijun Liu 2022-05-06  103  	kfree(cmd);
13e920d93e37fc Haijun Liu 2022-05-06  104  }
13e920d93e37fc Haijun Liu 2022-05-06  105  =

13e920d93e37fc Haijun Liu 2022-05-06  106  static void fsm_del_kf_event(str=
uct t7xx_fsm_event *event)
13e920d93e37fc Haijun Liu 2022-05-06  107  {
13e920d93e37fc Haijun Liu 2022-05-06  108  	list_del(&event->entry);
13e920d93e37fc Haijun Liu 2022-05-06  109  	kfree(event);
13e920d93e37fc Haijun Liu 2022-05-06  110  }
13e920d93e37fc Haijun Liu 2022-05-06  111  =

13e920d93e37fc Haijun Liu 2022-05-06  112  static void fsm_flush_event_cmd_=
qs(struct t7xx_fsm_ctl *ctl)
13e920d93e37fc Haijun Liu 2022-05-06  113  {
13e920d93e37fc Haijun Liu 2022-05-06  114  	struct device *dev =3D &ctl->md=
->t7xx_dev->pdev->dev;
13e920d93e37fc Haijun Liu 2022-05-06  115  	struct t7xx_fsm_event *event, *=
evt_next;
13e920d93e37fc Haijun Liu 2022-05-06  116  	struct t7xx_fsm_command *cmd, *=
cmd_next;
13e920d93e37fc Haijun Liu 2022-05-06  117  	unsigned long flags;
13e920d93e37fc Haijun Liu 2022-05-06  118  =

13e920d93e37fc Haijun Liu 2022-05-06  119  	spin_lock_irqsave(&ctl->command=
_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  120  	list_for_each_entry_safe(cmd, c=
md_next, &ctl->command_queue, entry) {
13e920d93e37fc Haijun Liu 2022-05-06  121  		dev_warn(dev, "Unhandled comma=
nd %d\n", cmd->cmd_id);
13e920d93e37fc Haijun Liu 2022-05-06  122  		list_del(&cmd->entry);
13e920d93e37fc Haijun Liu 2022-05-06 @123  		fsm_finish_command(ctl, cmd, -=
EINVAL);
13e920d93e37fc Haijun Liu 2022-05-06  124  	}
13e920d93e37fc Haijun Liu 2022-05-06  125  	spin_unlock_irqrestore(&ctl->co=
mmand_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  126  =

13e920d93e37fc Haijun Liu 2022-05-06  127  	spin_lock_irqsave(&ctl->event_l=
ock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  128  	list_for_each_entry_safe(event,=
 evt_next, &ctl->event_queue, entry) {
13e920d93e37fc Haijun Liu 2022-05-06  129  		dev_warn(dev, "Unhandled event=
 %d\n", event->event_id);
13e920d93e37fc Haijun Liu 2022-05-06 @130  		fsm_del_kf_event(event);
13e920d93e37fc Haijun Liu 2022-05-06  131  	}
13e920d93e37fc Haijun Liu 2022-05-06  132  	spin_unlock_irqrestore(&ctl->ev=
ent_lock, flags);
13e920d93e37fc Haijun Liu 2022-05-06  133  }
13e920d93e37fc Haijun Liu 2022-05-06  134  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2119535253375016561==--

