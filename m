Content-Type: multipart/mixed; boundary="===============1570856643186557827=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [pm:pm-sleep-core 2/2] drivers/base/power/main.c:664 device_resume_noirq() error: uninitialized symbol 'info'.
Date: Mon, 06 Apr 2020 14:21:55 +0300
Message-ID: <20200406112155.GG2001@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1570856643186557827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 pm-sleep-core
head:   547556fab555120662914c71c1fe8ea0643e1871
commit: 547556fab555120662914c71c1fe8ea0643e1871 [2/2] PM: sleep: core: Fol=
d functions into their callers
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/base/power/main.c:664 device_resume_noirq() error: uninitialized sy=
mbol 'info'.
drivers/base/power/main.c:1267 __device_suspend_noirq() error: uninitialize=
d symbol 'info'.
drivers/base/power/main.c:1468 __device_suspend_late() error: uninitialized=
 symbol 'info'.

# https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commi=
t/?id=3D547556fab555120662914c71c1fe8ea0643e1871
git remote add pm https://git.kernel.org/pub/scm/linux/kernel/git/rafael/li=
nux-pm.git
git remote update pm
git checkout 547556fab555120662914c71c1fe8ea0643e1871
vim +/info +664 drivers/base/power/main.c

76569faa62c4638 Liu, Chuansheng   2014-02-18  603  static int device_resume=
_noirq(struct device *dev, pm_message_t state, bool async)
775b64d2b6ca376 Rafael J. Wysocki 2008-01-12  604  {
547556fab555120 Rafael J. Wysocki 2020-04-04  605  	pm_callback_t callback =
=3D NULL;
4fa3061a6856cc7 Rafael J. Wysocki 2017-12-10  606  	const char *info;
32bfa56ac158c1e Rafael J. Wysocki 2017-12-10  607  	bool skip_resume;
775b64d2b6ca376 Rafael J. Wysocki 2008-01-12  608  	int error =3D 0;
775b64d2b6ca376 Rafael J. Wysocki 2008-01-12  609  =

775b64d2b6ca376 Rafael J. Wysocki 2008-01-12  610  	TRACE_DEVICE(dev);
775b64d2b6ca376 Rafael J. Wysocki 2008-01-12  611  	TRACE_RESUME(0);
775b64d2b6ca376 Rafael J. Wysocki 2008-01-12  612  =

aae4518b3124b29 Rafael J. Wysocki 2014-05-16  613  	if (dev->power.syscore =
|| dev->power.direct_complete)
dbf374142dd7a3c Rafael J. Wysocki 2012-08-06  614  		goto Out;
dbf374142dd7a3c Rafael J. Wysocki 2012-08-06  615  =

3d2699bc179a10e Liu, Chuansheng   2014-02-18  616  	if (!dev->power.is_noir=
q_suspended)
3d2699bc179a10e Liu, Chuansheng   2014-02-18  617  		goto Out;
3d2699bc179a10e Liu, Chuansheng   2014-02-18  618  =

0552e05fdfea191 Rafael J. Wysocki 2020-01-23  619  	if (!dpm_wait_for_super=
ior(dev, async))
0552e05fdfea191 Rafael J. Wysocki 2020-01-23  620  		goto Out;
76569faa62c4638 Liu, Chuansheng   2014-02-18  621  =

547556fab555120 Rafael J. Wysocki 2020-04-04  622  	if (dev->pm_domain) {
547556fab555120 Rafael J. Wysocki 2020-04-04  623  		info =3D "noirq power =
domain ";
547556fab555120 Rafael J. Wysocki 2020-04-04  624  		callback =3D pm_noirq_=
op(&dev->pm_domain->ops, state);
547556fab555120 Rafael J. Wysocki 2020-04-04  625  	} else if (dev->type &&=
 dev->type->pm) {
547556fab555120 Rafael J. Wysocki 2020-04-04  626  		info =3D "noirq type ";
547556fab555120 Rafael J. Wysocki 2020-04-04  627  		callback =3D pm_noirq_=
op(dev->type->pm, state);
547556fab555120 Rafael J. Wysocki 2020-04-04  628  	} else if (dev->class &=
& dev->class->pm) {
547556fab555120 Rafael J. Wysocki 2020-04-04  629  		info =3D "noirq class =
";
547556fab555120 Rafael J. Wysocki 2020-04-04  630  		callback =3D pm_noirq_=
op(dev->class->pm, state);
547556fab555120 Rafael J. Wysocki 2020-04-04  631  	} else if (dev->bus && =
dev->bus->pm) {
547556fab555120 Rafael J. Wysocki 2020-04-04  632  		info =3D "noirq bus ";
547556fab555120 Rafael J. Wysocki 2020-04-04  633  		callback =3D pm_noirq_=
op(dev->bus->pm, state);
547556fab555120 Rafael J. Wysocki 2020-04-04  634  	}

Assume none of these conditions are true

ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  635  	if (callback) {
ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  636  		skip_resume =3D false;
75e94645fc3b100 Rafael J. Wysocki 2017-12-10  637  		goto Run;
ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  638  	}
33c3374031facf7 Rafael J. Wysocki 2009-12-13  639  =

ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  640  	skip_resume =3D dev_pm_=
may_skip_resume(dev);
32bfa56ac158c1e Rafael J. Wysocki 2017-12-10  641  	if (skip_resume)
32bfa56ac158c1e Rafael J. Wysocki 2017-12-10  642  		goto Skip;
32bfa56ac158c1e Rafael J. Wysocki 2017-12-10  643  =

75e94645fc3b100 Rafael J. Wysocki 2017-12-10  644  	/*
ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  645  	 * If "freeze" driver c=
allbacks have been skipped during hibernation,
ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  646  	 * because the device w=
as runtime-suspended in __device_suspend_late(),
ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  647  	 * the corresponding "t=
haw" callbacks must be skipped too, because
ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  648  	 * running them for a r=
untime-suspended device may not be valid.
75e94645fc3b100 Rafael J. Wysocki 2017-12-10  649  	 */
ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  650  	if (dev_pm_smart_suspen=
d_and_suspended(dev) &&
ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  651  	    state.event =3D=3D =
PM_EVENT_THAW) {
32bfa56ac158c1e Rafael J. Wysocki 2017-12-10  652  		skip_resume =3D true;
75e94645fc3b100 Rafael J. Wysocki 2017-12-10  653  		goto Skip;
75e94645fc3b100 Rafael J. Wysocki 2017-12-10  654  	}
75e94645fc3b100 Rafael J. Wysocki 2017-12-10  655  =

75e94645fc3b100 Rafael J. Wysocki 2017-12-10  656  	if (dev->driver && dev-=
>driver->pm) {
cf579dfb82550e3 Rafael J. Wysocki 2012-01-29  657  		info =3D "noirq driver=
 ";
35cd133c6130c1e Rafael J. Wysocki 2011-12-18  658  		callback =3D pm_noirq_=
op(dev->driver->pm, state);
35cd133c6130c1e Rafael J. Wysocki 2011-12-18  659  	}

And these aren't true

35cd133c6130c1e Rafael J. Wysocki 2011-12-18  660  =

ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  661  	pm_runtime_set_active(d=
ev);
ff2d75f7550e29e Rafael J. Wysocki 2020-04-04  662  =

75e94645fc3b100 Rafael J. Wysocki 2017-12-10  663  Run:
9cf519d1c15fa05 Rafael J. Wysocki 2011-12-18 @664  	error =3D dpm_run_callb=
ack(callback, dev, state, info);
                                                                           =
                            ^^^^

75e94645fc3b100 Rafael J. Wysocki 2017-12-10  665  =

75e94645fc3b100 Rafael J. Wysocki 2017-12-10  666  Skip:
3d2699bc179a10e Liu, Chuansheng   2014-02-18  667  	dev->power.is_noirq_sus=
pended =3D false;
9cf519d1c15fa05 Rafael J. Wysocki 2011-12-18  668  =

32bfa56ac158c1e Rafael J. Wysocki 2017-12-10  669  	if (skip_resume) {
02bd45a28bf3299 Rafael J. Wysocki 2019-07-04  670  		/* Make the next phase=
s of resume skip the device. */
02bd45a28bf3299 Rafael J. Wysocki 2019-07-04  671  		dev->power.is_late_sus=
pended =3D false;
02bd45a28bf3299 Rafael J. Wysocki 2019-07-04  672  		dev->power.is_suspende=
d =3D false;
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  673  		/*
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  674  		 * The device is going=
 to be left in suspend, but it might not
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  675  		 * have been in runtim=
e suspend before the system suspended, so
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  676  		 * its runtime PM stat=
us needs to be updated to avoid confusing
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  677  		 * the runtime PM fram=
ework when runtime PM is enabled for the
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  678  		 * device again.
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  679  		 */
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  680  		pm_runtime_set_suspend=
ed(dev);
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  681  	}
0d4b54c6fee87ff Rafael J. Wysocki 2017-11-18  682  =

dbf374142dd7a3c Rafael J. Wysocki 2012-08-06  683  Out:
76569faa62c4638 Liu, Chuansheng   2014-02-18  684  	complete_all(&dev->powe=
r.completion);
775b64d2b6ca376 Rafael J. Wysocki 2008-01-12  685  	TRACE_RESUME(error);
775b64d2b6ca376 Rafael J. Wysocki 2008-01-12  686  	return error;
775b64d2b6ca376 Rafael J. Wysocki 2008-01-12  687  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1570856643186557827==--

