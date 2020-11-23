Content-Type: multipart/mixed; boundary="===============4149176897117736317=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/ti/wlcore/main.c:700:9: sparse: sparse: context imbalance in 'wlcore_irq' - different lock contexts for basic block
Date: Mon, 23 Nov 2020 09:16:03 +0800
Message-ID: <202011230953.WzJBPR0a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4149176897117736317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tony Lindgren <tony@atomide.com>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d5530d82efc8631beff20480b1168b1c44294fe1
commit: 35fba0f0fd762a8b87d403ae3c723e0061c4aa25 wlcore: Use spin_trylock i=
n wlcore_irq() to see if we need to queue tx
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: nios2-randconfig-s031-20201123 (attached as .config)
compiler: nios2-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-134-gb59dbdaf-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D35fba0f0fd762a8b87d403ae3c723e0061c4aa25
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 35fba0f0fd762a8b87d403ae3c723e0061c4aa25
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dnios2 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/net/wireless/ti/wlcore/main.c:643:34: sparse: sparse: context im=
balance in 'wlcore_irq_locked' - different lock contexts for basic block
>> drivers/net/wireless/ti/wlcore/main.c:700:9: sparse: sparse: context imb=
alance in 'wlcore_irq' - different lock contexts for basic block

vim +/wlcore_irq +700 drivers/net/wireless/ti/wlcore/main.c

1e73eb62cec7cf7 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
010-02-22  518  =

b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  519  static int wlcore_irq_locked(struct wl1271 *wl)
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  520  {
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  521  	int ret =3D 0;
c15f63bffabb996 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
009-10-12  522  	u32 intr;
1e73eb62cec7cf7 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
010-02-22  523  	int loopcount =3D WL1271_IRQ_MAX_LOOPS;
f0325e38ab39c2e drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  524  	bool run_tx_queue =3D true;
a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  525  	bool done =3D false;
a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  526  	unsigned int defer_count;
b07d4037051318d drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  527  	unsigned long flags;
b07d4037051318d drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  528  =

341b7cde6ccc606 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-31  529  	/*
341b7cde6ccc606 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-31  530  	 * In case edge triggered interrupt must be used, we canno=
t iterate
341b7cde6ccc606 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-31  531  	 * more than once without introducing race conditions with=
 the hardirq.
341b7cde6ccc606 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-31  532  	 */
6f921fab5844941 drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
015-03-18  533  	if (wl->irq_flags & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FA=
LLING))
341b7cde6ccc606 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-31  534  		loopcount =3D 1;
341b7cde6ccc606 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-31  535  =

f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  536  	wl1271_debug(DEBUG_IRQ, "IRQ work");
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  537  =

4cc533830b7e6b3 drivers/net/wireless/ti/wlcore/main.c     Ido Yariv       2=
012-07-24  538  	if (unlikely(wl->state !=3D WLCORE_STATE_ON))
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  539  		goto out;
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  540  =

fa2648a34e73fb7 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
018-06-19  541  	ret =3D pm_runtime_get_sync(wl->dev);
fa2648a34e73fb7 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
018-06-19  542  	if (ret < 0) {
fa2648a34e73fb7 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
018-06-19  543  		pm_runtime_put_noidle(wl->dev);
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  544  		goto out;
fa2648a34e73fb7 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
018-06-19  545  	}
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  546  =

a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  547  	while (!done && loopcount--) {
4e857c58efeb993 drivers/net/wireless/ti/wlcore/main.c     Peter Zijlstra  2=
014-03-17  548  		smp_mb__after_atomic();
1e73eb62cec7cf7 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
010-02-22  549  =

75fb4df7f804229 drivers/net/wireless/ti/wlcore/main.c     Eliad Peller    2=
014-02-10  550  		ret =3D wlcore_fw_status(wl, wl->fw_status);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  551  		if (ret < 0)
da74b6933b3ba27 drivers/net/wireless/ti/wlcore/main.c     Dinghao Liu     2=
020-05-22  552  			goto err_ret;
53d67a50cd17aca drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
011-12-12  553  =

53d67a50cd17aca drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
011-12-12  554  		wlcore_hw_tx_immediate_compl(wl);
53d67a50cd17aca drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
011-12-12  555  =

75fb4df7f804229 drivers/net/wireless/ti/wlcore/main.c     Eliad Peller    2=
014-02-10  556  		intr =3D wl->fw_status->intr;
f5755fe96cb0100 drivers/net/wireless/ti/wlcore/main.c     Ido Reis        2=
012-04-23  557  		intr &=3D WLCORE_ALL_INTR_MASK;
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  558  		if (!intr) {
a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  559  			done =3D true;
1e73eb62cec7cf7 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
010-02-22  560  			continue;
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  561  		}
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  562  =

ccc83b046c03378 drivers/net/wireless/wl12xx/wl1271_main.c Eliad Peller    2=
010-10-27  563  		if (unlikely(intr & WL1271_ACX_INTR_WATCHDOG)) {
f5755fe96cb0100 drivers/net/wireless/ti/wlcore/main.c     Ido Reis        2=
012-04-23  564  			wl1271_error("HW watchdog interrupt received! starting r=
ecovery.");
f5755fe96cb0100 drivers/net/wireless/ti/wlcore/main.c     Ido Reis        2=
012-04-23  565  			wl->watchdog_recovery =3D true;
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  566  			ret =3D -EIO;
f5755fe96cb0100 drivers/net/wireless/ti/wlcore/main.c     Ido Reis        2=
012-04-23  567  =

f5755fe96cb0100 drivers/net/wireless/ti/wlcore/main.c     Ido Reis        2=
012-04-23  568  			/* restarting the chip. ignore any other interrupt. */
da74b6933b3ba27 drivers/net/wireless/ti/wlcore/main.c     Dinghao Liu     2=
020-05-22  569  			goto err_ret;
f5755fe96cb0100 drivers/net/wireless/ti/wlcore/main.c     Ido Reis        2=
012-04-23  570  		}
f5755fe96cb0100 drivers/net/wireless/ti/wlcore/main.c     Ido Reis        2=
012-04-23  571  =

f5755fe96cb0100 drivers/net/wireless/ti/wlcore/main.c     Ido Reis        2=
012-04-23  572  		if (unlikely(intr & WL1271_ACX_SW_INTR_WATCHDOG)) {
f5755fe96cb0100 drivers/net/wireless/ti/wlcore/main.c     Ido Reis        2=
012-04-23  573  			wl1271_error("SW watchdog interrupt received! "
ccc83b046c03378 drivers/net/wireless/wl12xx/wl1271_main.c Eliad Peller    2=
010-10-27  574  				     "starting recovery.");
afbe37185c0ecad drivers/net/wireless/ti/wlcore/main.c     Yoni Divinsky   2=
012-05-16  575  			wl->watchdog_recovery =3D true;
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  576  			ret =3D -EIO;
ccc83b046c03378 drivers/net/wireless/wl12xx/wl1271_main.c Eliad Peller    2=
010-10-27  577  =

ccc83b046c03378 drivers/net/wireless/wl12xx/wl1271_main.c Eliad Peller    2=
010-10-27  578  			/* restarting the chip. ignore any other interrupt. */
da74b6933b3ba27 drivers/net/wireless/ti/wlcore/main.c     Dinghao Liu     2=
020-05-22  579  			goto err_ret;
ccc83b046c03378 drivers/net/wireless/wl12xx/wl1271_main.c Eliad Peller    2=
010-10-27  580  		}
ccc83b046c03378 drivers/net/wireless/wl12xx/wl1271_main.c Eliad Peller    2=
010-10-27  581  =

a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  582  		if (likely(intr & WL1271_ACX_INTR_DATA)) {
1e73eb62cec7cf7 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
010-02-22  583  			wl1271_debug(DEBUG_IRQ, "WL1271_ACX_INTR_DATA");
1e73eb62cec7cf7 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
010-02-22  584  =

75fb4df7f804229 drivers/net/wireless/ti/wlcore/main.c     Eliad Peller    2=
014-02-10  585  			ret =3D wlcore_rx(wl, wl->fw_status);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  586  			if (ret < 0)
da74b6933b3ba27 drivers/net/wireless/ti/wlcore/main.c     Dinghao Liu     2=
020-05-22  587  				goto err_ret;
1e73eb62cec7cf7 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
010-02-22  588  =

a522550a283de31 drivers/net/wireless/wl12xx/wl1271_main.c Ido Yariv       2=
010-10-12  589  			/* Check if any tx blocks were freed */
f0325e38ab39c2e drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  590  			if (!test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags)) {
f0325e38ab39c2e drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  591  				if (spin_trylock_irqsave(&wl->wl_lock, flags)) {
f0325e38ab39c2e drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  592  					if (!wl1271_tx_total_queue_count(wl))
f0325e38ab39c2e drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  593  						run_tx_queue =3D false;
b07d4037051318d drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  594  					spin_unlock_irqrestore(&wl->wl_lock, flags);
f0325e38ab39c2e drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  595  				}
f0325e38ab39c2e drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  596  =

a522550a283de31 drivers/net/wireless/wl12xx/wl1271_main.c Ido Yariv       2=
010-10-12  597  				/*
a522550a283de31 drivers/net/wireless/wl12xx/wl1271_main.c Ido Yariv       2=
010-10-12  598  				 * In order to avoid starvation of the TX path,
a522550a283de31 drivers/net/wireless/wl12xx/wl1271_main.c Ido Yariv       2=
010-10-12  599  				 * call the work function directly.
a522550a283de31 drivers/net/wireless/wl12xx/wl1271_main.c Ido Yariv       2=
010-10-12  600  				 */
f0325e38ab39c2e drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  601  				if (run_tx_queue) {
eb96f841b9563ba drivers/net/wireless/ti/wlcore/main.c     Ido Yariv       2=
012-06-18  602  					ret =3D wlcore_tx_work_locked(wl);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  603  					if (ret < 0)
da74b6933b3ba27 drivers/net/wireless/ti/wlcore/main.c     Dinghao Liu     2=
020-05-22  604  						goto err_ret;
f0325e38ab39c2e drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  605  				}
a522550a283de31 drivers/net/wireless/wl12xx/wl1271_main.c Ido Yariv       2=
010-10-12  606  			}
a522550a283de31 drivers/net/wireless/wl12xx/wl1271_main.c Ido Yariv       2=
010-10-12  607  =

8aad24642a7c068 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  608  			/* check for tx results */
045b9b5f4172b2b drivers/net/wireless/ti/wlcore/main.c     Ido Yariv       2=
012-06-18  609  			ret =3D wlcore_hw_tx_delayed_compl(wl);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  610  			if (ret < 0)
da74b6933b3ba27 drivers/net/wireless/ti/wlcore/main.c     Dinghao Liu     2=
020-05-22  611  				goto err_ret;
a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  612  =

a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  613  			/* Make sure the deferred queues don't get too long */
a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  614  			defer_count =3D skb_queue_len(&wl->deferred_tx_queue) +
a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  615  				      skb_queue_len(&wl->deferred_rx_queue);
a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  616  			if (defer_count > WL1271_DEFERRED_QUEUE_LIMIT)
a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  617  				wl1271_flush_deferred_work(wl);
1e73eb62cec7cf7 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
010-02-22  618  		}
1e73eb62cec7cf7 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
010-02-22  619  =

1fd2794f3691399 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
009-10-13  620  		if (intr & WL1271_ACX_INTR_EVENT_A) {
1fd2794f3691399 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
009-10-13  621  			wl1271_debug(DEBUG_IRQ, "WL1271_ACX_INTR_EVENT_A");
045b9b5f4172b2b drivers/net/wireless/ti/wlcore/main.c     Ido Yariv       2=
012-06-18  622  			ret =3D wl1271_event_handle(wl, 0);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  623  			if (ret < 0)
da74b6933b3ba27 drivers/net/wireless/ti/wlcore/main.c     Dinghao Liu     2=
020-05-22  624  				goto err_ret;
1fd2794f3691399 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
009-10-13  625  		}
1fd2794f3691399 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
009-10-13  626  =

1fd2794f3691399 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
009-10-13  627  		if (intr & WL1271_ACX_INTR_EVENT_B) {
1fd2794f3691399 drivers/net/wireless/wl12xx/wl1271_main.c Juuso Oikarinen 2=
009-10-13  628  			wl1271_debug(DEBUG_IRQ, "WL1271_ACX_INTR_EVENT_B");
045b9b5f4172b2b drivers/net/wireless/ti/wlcore/main.c     Ido Yariv       2=
012-06-18  629  			ret =3D wl1271_event_handle(wl, 1);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  630  			if (ret < 0)
da74b6933b3ba27 drivers/net/wireless/ti/wlcore/main.c     Dinghao Liu     2=
020-05-22  631  				goto err_ret;
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  632  		}
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  633  =

f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  634  		if (intr & WL1271_ACX_INTR_INIT_COMPLETE)
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  635  			wl1271_debug(DEBUG_IRQ,
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  636  				     "WL1271_ACX_INTR_INIT_COMPLETE");
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  637  =

f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  638  		if (intr & WL1271_ACX_INTR_HW_AVAILABLE)
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  639  			wl1271_debug(DEBUG_IRQ, "WL1271_ACX_INTR_HW_AVAILABLE");
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  640  	}
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  641  =

da74b6933b3ba27 drivers/net/wireless/ti/wlcore/main.c     Dinghao Liu     2=
020-05-22  642  err_ret:
9b71578de08748d drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
018-06-19 @643  	pm_runtime_mark_last_busy(wl->dev);
9b71578de08748d drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
018-06-19  644  	pm_runtime_put_autosuspend(wl->dev);
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  645  =

f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  646  out:
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  647  	return ret;
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  648  }
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  649  =

b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  650  static irqreturn_t wlcore_irq(int irq, void *cookie)
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  651  {
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  652  	int ret;
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  653  	unsigned long flags;
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  654  	struct wl1271 *wl =3D cookie;
35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  655  	bool queue_tx_work =3D true;
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  656  =

eb215c33f308cef drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  657  	set_bit(WL1271_FLAG_IRQ_RUNNING, &wl->flags);
eb215c33f308cef drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  658  =

97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  659  	/* complete the ELP completion */
eb215c33f308cef drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  660  	if (test_bit(WL1271_FLAG_IN_ELP, &wl->flags)) {
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  661  		spin_lock_irqsave(&wl->wl_lock, flags);
eb215c33f308cef drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  662  		if (wl->elp_compl)
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  663  			complete(wl->elp_compl);
eb215c33f308cef drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  664  		spin_unlock_irqrestore(&wl->wl_lock, flags);
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  665  	}
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  666  =

97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  667  	if (test_bit(WL1271_FLAG_SUSPENDED, &wl->flags)) {
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  668  		/* don't enqueue a work right now. mark it as pending */
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  669  		set_bit(WL1271_FLAG_PENDING_WORK, &wl->flags);
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  670  		wl1271_debug(DEBUG_IRQ, "should not enqueue work");
eb215c33f308cef drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  671  		spin_lock_irqsave(&wl->wl_lock, flags);
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  672  		disable_irq_nosync(wl->irq);
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  673  		pm_wakeup_event(wl->dev, 0);
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  674  		spin_unlock_irqrestore(&wl->wl_lock, flags);
4633d30b61ac141 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
019-10-09  675  		goto out_handled;
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  676  	}
97236a0656034ef drivers/net/wireless/ti/wlcore/main.c     Luciano Coelho  2=
013-03-08  677  =

b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  678  	/* TX might be handled here, avoid redundant work */
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  679  	set_bit(WL1271_FLAG_TX_PENDING, &wl->flags);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  680  	cancel_work_sync(&wl->tx_work);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  681  =

b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  682  	mutex_lock(&wl->mutex);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  683  =

b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  684  	ret =3D wlcore_irq_locked(wl);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  685  	if (ret)
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  686  		wl12xx_queue_recovery_work(wl);
b5b45b3cbd56162 drivers/net/wireless/ti/wlcore/main.c     Arik Nemtsov    2=
012-06-21  687  =

35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  688  	/* In case TX was not handled in wlcore_irq_locked(), queu=
e TX work */
b07d4037051318d drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  689  	clear_bit(WL1271_FLAG_TX_PENDING, &wl->flags);
35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  690  	if (!test_bit(WL1271_FLAG_FW_TX_BUSY, &wl->flags)) {
35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  691  		if (spin_trylock_irqsave(&wl->wl_lock, flags)) {
35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  692  			if (!wl1271_tx_total_queue_count(wl))
35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  693  				queue_tx_work =3D false;
b07d4037051318d drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  694  			spin_unlock_irqrestore(&wl->wl_lock, flags);
35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  695  		}
35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  696  		if (queue_tx_work)
35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  697  			ieee80211_queue_work(wl->hw, &wl->tx_work);
35fba0f0fd762a8 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
020-07-02  698  	}
b07d4037051318d drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  699  =

f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06 @700  	mutex_unlock(&wl->mutex);
a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  701  =

4633d30b61ac141 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
019-10-09  702  out_handled:
4633d30b61ac141 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
019-10-09  703  	spin_lock_irqsave(&wl->wl_lock, flags);
4633d30b61ac141 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
019-10-09  704  	clear_bit(WL1271_FLAG_IRQ_RUNNING, &wl->flags);
4633d30b61ac141 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
019-10-09  705  	spin_unlock_irqrestore(&wl->wl_lock, flags);
4633d30b61ac141 drivers/net/wireless/ti/wlcore/main.c     Tony Lindgren   2=
019-10-09  706  =

a620865edf62ea2 drivers/net/wireless/wl12xx/main.c        Ido Yariv       2=
011-03-01  707  	return IRQ_HANDLED;
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  708  }
f5fc0f86b02afef drivers/net/wireless/wl12xx/wl1271_main.c Luciano Coelho  2=
009-08-06  709  =


:::::: The code at line 700 was first introduced by commit
:::::: f5fc0f86b02afef1119b523623b4cde41475bc8c wl1271: add wl1271 driver f=
iles

:::::: TO: Luciano Coelho <luciano.coelho@nokia.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4149176897117736317==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4149176897117736317==--

