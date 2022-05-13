Content-Type: multipart/mixed; boundary="===============7485113133180840522=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9625/11360] drivers/net/wwan/t7xx/t7xx_modem_ops.c:498:52-57: ERROR: invalid reference to the index variable of the iterator on line 472
Date: Fri, 13 May 2022 08:29:06 +0800
Message-ID: <202205130746.cu63jOyz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7485113133180840522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: Loic Poulain <loic.poulain@linaro.org>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   187b9ac8c348383f7f36c8413d73ad89e9b1e90a
commit: da45d2566a1d4e260b894ff5d96be64b21c7fa79 [9625/11360] net: wwan: t7=
xx: Add control port
:::::: branch date: 14 hours ago
:::::: commit date: 4 days ago
config: csky-randconfig-c023-20220512 (https://download.01.org/0day-ci/arch=
ive/20220513/202205130746.cu63jOyz-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/wwan/t7xx/t7xx_modem_ops.c:498:52-57: ERROR: invalid referen=
ce to the index variable of the iterator on line 472
   drivers/net/wwan/t7xx/t7xx_modem_ops.c:498:65-70: ERROR: invalid referen=
ce to the index variable of the iterator on line 472
   drivers/net/wwan/t7xx/t7xx_modem_ops.c:517:7-12: ERROR: invalid referenc=
e to the index variable of the iterator on line 472

vim +498 drivers/net/wwan/t7xx/t7xx_modem_ops.c

da45d2566a1d4e Haijun Liu 2022-05-06  455  =

da45d2566a1d4e Haijun Liu 2022-05-06  456  static void t7xx_core_hk_handler=
(struct t7xx_modem *md, struct t7xx_fsm_ctl *ctl,
da45d2566a1d4e Haijun Liu 2022-05-06  457  				 enum t7xx_fsm_event_state e=
vent_id,
da45d2566a1d4e Haijun Liu 2022-05-06  458  				 enum t7xx_fsm_event_state e=
rr_detect)
da45d2566a1d4e Haijun Liu 2022-05-06  459  {
da45d2566a1d4e Haijun Liu 2022-05-06  460  	struct t7xx_sys_info *core_info=
 =3D &md->core_md;
da45d2566a1d4e Haijun Liu 2022-05-06  461  	struct device *dev =3D &md->t7x=
x_dev->pdev->dev;
da45d2566a1d4e Haijun Liu 2022-05-06  462  	struct t7xx_fsm_event *event, *=
event_next;
da45d2566a1d4e Haijun Liu 2022-05-06  463  	unsigned long flags;
da45d2566a1d4e Haijun Liu 2022-05-06  464  	int ret;
da45d2566a1d4e Haijun Liu 2022-05-06  465  =

da45d2566a1d4e Haijun Liu 2022-05-06  466  	t7xx_prepare_host_rt_data_query=
(core_info);
da45d2566a1d4e Haijun Liu 2022-05-06  467  =

da45d2566a1d4e Haijun Liu 2022-05-06  468  	while (!kthread_should_stop()) {
da45d2566a1d4e Haijun Liu 2022-05-06  469  		bool event_received =3D false;
da45d2566a1d4e Haijun Liu 2022-05-06  470  =

da45d2566a1d4e Haijun Liu 2022-05-06  471  		spin_lock_irqsave(&ctl->event_=
lock, flags);
da45d2566a1d4e Haijun Liu 2022-05-06 @472  		list_for_each_entry_safe(event=
, event_next, &ctl->event_queue, entry) {
da45d2566a1d4e Haijun Liu 2022-05-06  473  			if (event->event_id =3D=3D er=
r_detect) {
da45d2566a1d4e Haijun Liu 2022-05-06  474  				list_del(&event->entry);
da45d2566a1d4e Haijun Liu 2022-05-06  475  				spin_unlock_irqrestore(&ctl-=
>event_lock, flags);
da45d2566a1d4e Haijun Liu 2022-05-06  476  				dev_err(dev, "Core handshake=
 error event received\n");
da45d2566a1d4e Haijun Liu 2022-05-06  477  				goto err_free_event;
da45d2566a1d4e Haijun Liu 2022-05-06  478  			} else if (event->event_id =
=3D=3D event_id) {
da45d2566a1d4e Haijun Liu 2022-05-06  479  				list_del(&event->entry);
da45d2566a1d4e Haijun Liu 2022-05-06  480  				event_received =3D true;
da45d2566a1d4e Haijun Liu 2022-05-06  481  				break;
da45d2566a1d4e Haijun Liu 2022-05-06  482  			}
da45d2566a1d4e Haijun Liu 2022-05-06  483  		}
da45d2566a1d4e Haijun Liu 2022-05-06  484  		spin_unlock_irqrestore(&ctl->e=
vent_lock, flags);
da45d2566a1d4e Haijun Liu 2022-05-06  485  =

da45d2566a1d4e Haijun Liu 2022-05-06  486  		if (event_received)
da45d2566a1d4e Haijun Liu 2022-05-06  487  			break;
da45d2566a1d4e Haijun Liu 2022-05-06  488  =

da45d2566a1d4e Haijun Liu 2022-05-06  489  		wait_event_interruptible(ctl->=
event_wq, !list_empty(&ctl->event_queue) ||
da45d2566a1d4e Haijun Liu 2022-05-06  490  					 kthread_should_stop());
da45d2566a1d4e Haijun Liu 2022-05-06  491  		if (kthread_should_stop())
da45d2566a1d4e Haijun Liu 2022-05-06  492  			goto err_free_event;
da45d2566a1d4e Haijun Liu 2022-05-06  493  	}
da45d2566a1d4e Haijun Liu 2022-05-06  494  =

da45d2566a1d4e Haijun Liu 2022-05-06  495  	if (ctl->exp_flg)
da45d2566a1d4e Haijun Liu 2022-05-06  496  		goto err_free_event;
da45d2566a1d4e Haijun Liu 2022-05-06  497  =

da45d2566a1d4e Haijun Liu 2022-05-06 @498  	ret =3D t7xx_parse_host_rt_data=
(ctl, core_info, dev, event->data, event->length);
da45d2566a1d4e Haijun Liu 2022-05-06  499  	if (ret) {
da45d2566a1d4e Haijun Liu 2022-05-06  500  		dev_err(dev, "Host failure par=
sing runtime data: %d\n", ret);
da45d2566a1d4e Haijun Liu 2022-05-06  501  		goto err_free_event;
da45d2566a1d4e Haijun Liu 2022-05-06  502  	}
da45d2566a1d4e Haijun Liu 2022-05-06  503  =

da45d2566a1d4e Haijun Liu 2022-05-06  504  	if (ctl->exp_flg)
da45d2566a1d4e Haijun Liu 2022-05-06  505  		goto err_free_event;
da45d2566a1d4e Haijun Liu 2022-05-06  506  =

da45d2566a1d4e Haijun Liu 2022-05-06  507  	ret =3D t7xx_prepare_device_rt_=
data(core_info, dev, event->data);
da45d2566a1d4e Haijun Liu 2022-05-06  508  	if (ret) {
da45d2566a1d4e Haijun Liu 2022-05-06  509  		dev_err(dev, "Device failure p=
arsing runtime data: %d", ret);
da45d2566a1d4e Haijun Liu 2022-05-06  510  		goto err_free_event;
da45d2566a1d4e Haijun Liu 2022-05-06  511  	}
da45d2566a1d4e Haijun Liu 2022-05-06  512  =

da45d2566a1d4e Haijun Liu 2022-05-06  513  	core_info->ready =3D true;
da45d2566a1d4e Haijun Liu 2022-05-06  514  	core_info->handshake_ongoing =
=3D false;
da45d2566a1d4e Haijun Liu 2022-05-06  515  	wake_up(&ctl->async_hk_wq);
da45d2566a1d4e Haijun Liu 2022-05-06  516  err_free_event:
da45d2566a1d4e Haijun Liu 2022-05-06  517  	kfree(event);
da45d2566a1d4e Haijun Liu 2022-05-06  518  }
da45d2566a1d4e Haijun Liu 2022-05-06  519  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7485113133180840522==--

