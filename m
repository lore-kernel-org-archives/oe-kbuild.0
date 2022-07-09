Content-Type: multipart/mixed; boundary="===============6946070789819037583=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c:165:20: error: dereference of NULL 'skb' [CWE-476]
Date: Sun, 10 Jul 2022 05:18:43 +0800
Message-ID: <202207100559.5yYRjyWw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6946070789819037583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: Loic Poulain <loic.poulain@linaro.org>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b1c428b6c3684ee8ddf4137d68b3e8d51d2a700f
commit: da45d2566a1d4e260b894ff5d96be64b21c7fa79 net: wwan: t7xx: Add contr=
ol port
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20220710 (https://download.01.org/0day-ci/archi=
ve/20220710/202207100559.5yYRjyWw-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dda45d2566a1d4e260b894ff5d96be64b21c7fa79
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout da45d2566a1d4e260b894ff5d96be64b21c7fa79
        # save the config file
         =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c: In function 'control_msg_han=
dler':
>> drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c:165:20: error: dereference of=
 NULL 'skb' [CWE-476] [-Werror=3Danalyzer-null-dereference]
     165 |         ctrl_msg_h =3D (struct ctrl_msg_header *)skb->data;
         |         ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'port_ctl_rx_thread': events 1-2
       |
       |  212 | static int port_ctl_rx_thread(void *arg)
       |      |            ^~~~~~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'port_ctl_rx_thread'
       |  213 | {
       |  214 |         while (!kthread_should_stop()) {
       |      |                ~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) following 'false' branch...
       |
     'port_ctl_rx_thread': event 3
       |
       |include/linux/spinlock.h:324:16:
       |  324 |         return &lock->rlock;
       |      |                ^~~~~~~~~~~~
       |      |                |
       |      |                (3) ...to here
       |
     'port_ctl_rx_thread': events 4-6
       |
       |drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c:227:20:
       |  227 |                 if (kthread_should_stop()) {
       |      |                    ^
       |      |                    |
       |      |                    (4) following 'false' branch...
       |......
       |  231 |                 skb =3D __skb_dequeue(&port->rx_skb_list);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (5) ...to here
       |......
       |  234 |                 control_msg_handler(port, skb);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (6) calling 'control_msg_handler' from 'por=
t_ctl_rx_thread'
       |
       +--> 'control_msg_handler': events 7-8
              |
              |  158 | static int control_msg_handler(struct t7xx_port *por=
t, struct sk_buff *skb)
              |      |            ^~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'control_msg_handler'
              |......
              |  165 |         ctrl_msg_h =3D (struct ctrl_msg_header *)skb=
->data;
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
              |      |                    |
              |      |                    (8) dereference of NULL 'skb'
              |
   cc1: all warnings being treated as errors


vim +/skb +165 drivers/net/wwan/t7xx/t7xx_port_ctrl_msg.c

da45d2566a1d4e Haijun Liu 2022-05-06  157  =

da45d2566a1d4e Haijun Liu 2022-05-06  158  static int control_msg_handler(s=
truct t7xx_port *port, struct sk_buff *skb)
da45d2566a1d4e Haijun Liu 2022-05-06  159  {
da45d2566a1d4e Haijun Liu 2022-05-06  160  	const struct t7xx_port_conf *po=
rt_conf =3D port->port_conf;
da45d2566a1d4e Haijun Liu 2022-05-06  161  	struct t7xx_fsm_ctl *ctl =3D po=
rt->t7xx_dev->md->fsm_ctl;
da45d2566a1d4e Haijun Liu 2022-05-06  162  	struct ctrl_msg_header *ctrl_ms=
g_h;
da45d2566a1d4e Haijun Liu 2022-05-06  163  	int ret =3D 0;
da45d2566a1d4e Haijun Liu 2022-05-06  164  =

da45d2566a1d4e Haijun Liu 2022-05-06 @165  	ctrl_msg_h =3D (struct ctrl_msg=
_header *)skb->data;
da45d2566a1d4e Haijun Liu 2022-05-06  166  	switch (le32_to_cpu(ctrl_msg_h-=
>ctrl_msg_id)) {
da45d2566a1d4e Haijun Liu 2022-05-06  167  	case CTL_ID_HS2_MSG:
da45d2566a1d4e Haijun Liu 2022-05-06  168  		skb_pull(skb, sizeof(*ctrl_msg=
_h));
da45d2566a1d4e Haijun Liu 2022-05-06  169  =

da45d2566a1d4e Haijun Liu 2022-05-06  170  		if (port_conf->rx_ch =3D=3D PO=
RT_CH_CONTROL_RX) {
da45d2566a1d4e Haijun Liu 2022-05-06  171  			ret =3D t7xx_fsm_append_event=
(ctl, FSM_EVENT_MD_HS2, skb->data,
da45d2566a1d4e Haijun Liu 2022-05-06  172  						    le32_to_cpu(ctrl_msg_h=
->data_length));
da45d2566a1d4e Haijun Liu 2022-05-06  173  			if (ret)
da45d2566a1d4e Haijun Liu 2022-05-06  174  				dev_err(port->dev, "Failed t=
o append Handshake 2 event");
da45d2566a1d4e Haijun Liu 2022-05-06  175  		}
da45d2566a1d4e Haijun Liu 2022-05-06  176  =

da45d2566a1d4e Haijun Liu 2022-05-06  177  		dev_kfree_skb_any(skb);
da45d2566a1d4e Haijun Liu 2022-05-06  178  		break;
da45d2566a1d4e Haijun Liu 2022-05-06  179  =

da45d2566a1d4e Haijun Liu 2022-05-06  180  	case CTL_ID_MD_EX:
da45d2566a1d4e Haijun Liu 2022-05-06  181  	case CTL_ID_MD_EX_ACK:
da45d2566a1d4e Haijun Liu 2022-05-06  182  	case CTL_ID_MD_EX_PASS:
da45d2566a1d4e Haijun Liu 2022-05-06  183  	case CTL_ID_DRV_VER_ERROR:
da45d2566a1d4e Haijun Liu 2022-05-06  184  		ret =3D fsm_ee_message_handler=
(port, ctl, skb);
da45d2566a1d4e Haijun Liu 2022-05-06  185  		dev_kfree_skb_any(skb);
da45d2566a1d4e Haijun Liu 2022-05-06  186  		break;
da45d2566a1d4e Haijun Liu 2022-05-06  187  =

da45d2566a1d4e Haijun Liu 2022-05-06  188  	case CTL_ID_PORT_ENUM:
da45d2566a1d4e Haijun Liu 2022-05-06  189  		skb_pull(skb, sizeof(*ctrl_msg=
_h));
da45d2566a1d4e Haijun Liu 2022-05-06  190  		ret =3D t7xx_port_enum_msg_han=
dler(ctl->md, (struct port_msg *)skb->data);
da45d2566a1d4e Haijun Liu 2022-05-06  191  		if (!ret)
da45d2566a1d4e Haijun Liu 2022-05-06  192  			ret =3D port_ctl_send_msg_to_=
md(port, CTL_ID_PORT_ENUM, 0);
da45d2566a1d4e Haijun Liu 2022-05-06  193  		else
da45d2566a1d4e Haijun Liu 2022-05-06  194  			ret =3D port_ctl_send_msg_to_=
md(port, CTL_ID_PORT_ENUM,
da45d2566a1d4e Haijun Liu 2022-05-06  195  						      PORT_ENUM_VER_MISMAT=
CH);
da45d2566a1d4e Haijun Liu 2022-05-06  196  =

da45d2566a1d4e Haijun Liu 2022-05-06  197  		break;
da45d2566a1d4e Haijun Liu 2022-05-06  198  =

da45d2566a1d4e Haijun Liu 2022-05-06  199  	default:
da45d2566a1d4e Haijun Liu 2022-05-06  200  		ret =3D -EINVAL;
da45d2566a1d4e Haijun Liu 2022-05-06  201  		dev_err(port->dev, "Unknown co=
ntrol message ID to FSM %x\n",
da45d2566a1d4e Haijun Liu 2022-05-06  202  			le32_to_cpu(ctrl_msg_h->ctrl_=
msg_id));
da45d2566a1d4e Haijun Liu 2022-05-06  203  		break;
da45d2566a1d4e Haijun Liu 2022-05-06  204  	}
da45d2566a1d4e Haijun Liu 2022-05-06  205  =

da45d2566a1d4e Haijun Liu 2022-05-06  206  	if (ret)
da45d2566a1d4e Haijun Liu 2022-05-06  207  		dev_err(port->dev, "%s control=
 message handle error: %d\n", port_conf->name, ret);
da45d2566a1d4e Haijun Liu 2022-05-06  208  =

da45d2566a1d4e Haijun Liu 2022-05-06  209  	return ret;
da45d2566a1d4e Haijun Liu 2022-05-06  210  }
da45d2566a1d4e Haijun Liu 2022-05-06  211  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6946070789819037583==--

