Content-Type: multipart/mixed; boundary="===============3823301340739049722=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/qcom/rpmh-rsc.c:798:12: sparse: sparse: context imbalance in 'rpmh_rsc_cpu_pm_callback' - different lock contexts for basic block
Date: Fri, 10 Jul 2020 14:33:52 +0800
Message-ID: <202007101448.JqdATWbU%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3823301340739049722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Douglas Anderson <dianders@chromium.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Stephen Boyd <swboyd@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0bddd227f3dc55975e2b8dfa7fc6f959b062a2c7
commit: d2a8cfc6f320263b90ca523590a339661d0f4fae soc: qcom: rpmh-rsc: Remov=
e the pm_lock
date:   8 weeks ago
:::::: branch date: 35 hours ago
:::::: commit date: 8 weeks ago
config: m68k-randconfig-s032-20200710 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-37-gc9676a3b-dirty
        git checkout d2a8cfc6f320263b90ca523590a339661d0f4fae
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/soc/qcom/rpmh-rsc.c:181:9: sparse: sparse: cast removes address =
space '<asn:2>' of expression
   drivers/soc/qcom/rpmh-rsc.c:182:13: sparse: sparse: cast removes address=
 space '<asn:2>' of expression
   drivers/soc/qcom/rpmh-rsc.c:182:13: sparse: sparse: cast removes address=
 space '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:9: sparse: sparse: cast removes address spa=
ce '<asn:2>' of expression
   include/asm-generic/io.h:299:9: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned int volatile @@     go=
t restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:9: sparse:     expected unsigned int volati=
le
   include/asm-generic/io.h:299:9: sparse:     got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:299:9: sparse: sparse: cast removes address spa=
ce '<asn:2>' of expression
   include/asm-generic/io.h:299:9: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned int volatile @@     go=
t restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:9: sparse:     expected unsigned int volati=
le
   include/asm-generic/io.h:299:9: sparse:     got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:9: sparse: sparse: cast removes address spa=
ce '<asn:2>' of expression
   include/asm-generic/io.h:299:9: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned int volatile @@     go=
t restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:9: sparse:     expected unsigned int volati=
le
   include/asm-generic/io.h:299:9: sparse:     got restricted __le32 [usert=
ype]
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:9: sparse: sparse: cast removes address spa=
ce '<asn:2>' of expression
   include/asm-generic/io.h:299:9: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned int volatile @@     go=
t restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:9: sparse:     expected unsigned int volati=
le
   include/asm-generic/io.h:299:9: sparse:     got restricted __le32 [usert=
ype]
>> drivers/soc/qcom/rpmh-rsc.c:798:12: sparse: sparse: context imbalance in=
 'rpmh_rsc_cpu_pm_callback' - different lock contexts for basic block
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:267:16: sparse: sparse: cast removes address sp=
ace '<asn:2>' of expression
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:299:9: sparse: sparse: cast removes address spa=
ce '<asn:2>' of expression
   include/asm-generic/io.h:299:9: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned int volatile @@     go=
t restricted __le32 [usertype] @@
   include/asm-generic/io.h:299:9: sparse:     expected unsigned int volati=
le
   include/asm-generic/io.h:299:9: sparse:     got restricted __le32 [usert=
ype]
--
>> include/linux/spinlock.h:393:9: sparse: sparse: context imbalance in 'rp=
mh_flush' - wrong count at exit

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd2a8cfc6f320263b90ca523590a339661d0f4fae
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout d2a8cfc6f320263b90ca523590a339661d0f4fae
vim +/rpmh_rsc_cpu_pm_callback +798 drivers/soc/qcom/rpmh-rsc.c

985427f997b6a3 Maulik Shah      2020-04-12  780  =

e40b0c1628f279 Douglas Anderson 2020-04-13  781  /**
e40b0c1628f279 Douglas Anderson 2020-04-13  782   * rpmh_rsc_cpu_pm_callbac=
k() - Check if any of the AMCs are busy.
e40b0c1628f279 Douglas Anderson 2020-04-13  783   * @nfb:    Pointer to the=
 notifier block in struct rsc_drv.
e40b0c1628f279 Douglas Anderson 2020-04-13  784   * @action: CPU_PM_ENTER, =
CPU_PM_ENTER_FAILED, or CPU_PM_EXIT.
e40b0c1628f279 Douglas Anderson 2020-04-13  785   * @v:      Unused
e40b0c1628f279 Douglas Anderson 2020-04-13  786   *
e40b0c1628f279 Douglas Anderson 2020-04-13  787   * This function is given =
to cpu_pm_register_notifier so we can be informed
e40b0c1628f279 Douglas Anderson 2020-04-13  788   * about when CPUs go down=
. When all CPUs go down we know no more active
e40b0c1628f279 Douglas Anderson 2020-04-13  789   * transfers will be start=
ed so we write sleep/wake sets. This function gets
e40b0c1628f279 Douglas Anderson 2020-04-13  790   * called from cpuidle cod=
e paths and also at system suspend time.
e40b0c1628f279 Douglas Anderson 2020-04-13  791   *
e40b0c1628f279 Douglas Anderson 2020-04-13  792   * If its last CPU going d=
own and AMCs are not busy then writes cached sleep
e40b0c1628f279 Douglas Anderson 2020-04-13  793   * and wake messages to TC=
Ses. The firmware then takes care of triggering
e40b0c1628f279 Douglas Anderson 2020-04-13  794   * them when entering deep=
est low power modes.
e40b0c1628f279 Douglas Anderson 2020-04-13  795   *
e40b0c1628f279 Douglas Anderson 2020-04-13  796   * Return: See cpu_pm_regi=
ster_notifier()
e40b0c1628f279 Douglas Anderson 2020-04-13  797   */
985427f997b6a3 Maulik Shah      2020-04-12 @798  static int rpmh_rsc_cpu_pm=
_callback(struct notifier_block *nfb,
985427f997b6a3 Maulik Shah      2020-04-12  799  				    unsigned long acti=
on, void *v)
985427f997b6a3 Maulik Shah      2020-04-12  800  {
985427f997b6a3 Maulik Shah      2020-04-12  801  	struct rsc_drv *drv =3D c=
ontainer_of(nfb, struct rsc_drv, rsc_pm);
985427f997b6a3 Maulik Shah      2020-04-12  802  	int ret =3D NOTIFY_OK;
d2a8cfc6f32026 Douglas Anderson 2020-05-04  803  	int cpus_in_pm;
985427f997b6a3 Maulik Shah      2020-04-12  804  =

985427f997b6a3 Maulik Shah      2020-04-12  805  	switch (action) {
985427f997b6a3 Maulik Shah      2020-04-12  806  	case CPU_PM_ENTER:
d2a8cfc6f32026 Douglas Anderson 2020-05-04  807  		cpus_in_pm =3D atomic_in=
c_return(&drv->cpus_in_pm);
d2a8cfc6f32026 Douglas Anderson 2020-05-04  808  		/*
d2a8cfc6f32026 Douglas Anderson 2020-05-04  809  		 * NOTE: comments for nu=
m_online_cpus() point out that it's
d2a8cfc6f32026 Douglas Anderson 2020-05-04  810  		 * only a snapshot so we=
 need to be careful. It should be OK
d2a8cfc6f32026 Douglas Anderson 2020-05-04  811  		 * for us to use, though=
.  It's important for us not to miss
d2a8cfc6f32026 Douglas Anderson 2020-05-04  812  		 * if we're the last CPU=
 going down so it would only be a
d2a8cfc6f32026 Douglas Anderson 2020-05-04  813  		 * problem if a CPU went=
 offline right after we did the check
d2a8cfc6f32026 Douglas Anderson 2020-05-04  814  		 * AND that CPU was not =
idle AND that CPU was the last non-idle
d2a8cfc6f32026 Douglas Anderson 2020-05-04  815  		 * CPU. That can't happe=
n. CPUs would have to come out of idle
d2a8cfc6f32026 Douglas Anderson 2020-05-04  816  		 * before the CPU could =
go offline.
d2a8cfc6f32026 Douglas Anderson 2020-05-04  817  		 */
d2a8cfc6f32026 Douglas Anderson 2020-05-04  818  		if (cpus_in_pm < num_onl=
ine_cpus())
d2a8cfc6f32026 Douglas Anderson 2020-05-04  819  			return NOTIFY_OK;
985427f997b6a3 Maulik Shah      2020-04-12  820  		break;
985427f997b6a3 Maulik Shah      2020-04-12  821  	case CPU_PM_ENTER_FAILED:
985427f997b6a3 Maulik Shah      2020-04-12  822  	case CPU_PM_EXIT:
d2a8cfc6f32026 Douglas Anderson 2020-05-04  823  		atomic_dec(&drv->cpus_in=
_pm);
d2a8cfc6f32026 Douglas Anderson 2020-05-04  824  		return NOTIFY_OK;
1143c36656b8dc Douglas Anderson 2020-05-04  825  	default:
d2a8cfc6f32026 Douglas Anderson 2020-05-04  826  		return NOTIFY_DONE;
985427f997b6a3 Maulik Shah      2020-04-12  827  	}
985427f997b6a3 Maulik Shah      2020-04-12  828  =

d2a8cfc6f32026 Douglas Anderson 2020-05-04  829  	/*
d2a8cfc6f32026 Douglas Anderson 2020-05-04  830  	 * It's likely we're on t=
he last CPU. Grab the drv->lock and write
d2a8cfc6f32026 Douglas Anderson 2020-05-04  831  	 * out the sleep/wake com=
mands to RPMH hardware. Grabbing the lock
d2a8cfc6f32026 Douglas Anderson 2020-05-04  832  	 * means that if we race =
with another CPU coming up we are still
d2a8cfc6f32026 Douglas Anderson 2020-05-04  833  	 * guaranteed to be safe.=
 If another CPU came up just after we checked
d2a8cfc6f32026 Douglas Anderson 2020-05-04  834  	 * and has grabbed the lo=
ck or started an active transfer then we'll
d2a8cfc6f32026 Douglas Anderson 2020-05-04  835  	 * notice we're busy and =
abort. If another CPU comes up after we start
d2a8cfc6f32026 Douglas Anderson 2020-05-04  836  	 * flushing it will be bl=
ocked from starting an active transfer until
d2a8cfc6f32026 Douglas Anderson 2020-05-04  837  	 * we're done flushing. I=
f another CPU starts an active transfer after
d2a8cfc6f32026 Douglas Anderson 2020-05-04  838  	 * we release the lock we=
're still OK because we're no longer the last
d2a8cfc6f32026 Douglas Anderson 2020-05-04  839  	 * CPU.
d2a8cfc6f32026 Douglas Anderson 2020-05-04  840  	 */
d2a8cfc6f32026 Douglas Anderson 2020-05-04  841  	if (spin_trylock(&drv->lo=
ck)) {
d2a8cfc6f32026 Douglas Anderson 2020-05-04  842  		if (rpmh_rsc_ctrlr_is_bu=
sy(drv) || rpmh_flush(&drv->client))
985427f997b6a3 Maulik Shah      2020-04-12  843  			ret =3D NOTIFY_BAD;
d2a8cfc6f32026 Douglas Anderson 2020-05-04  844  		spin_unlock(&drv->lock);
d2a8cfc6f32026 Douglas Anderson 2020-05-04  845  	} else {
d2a8cfc6f32026 Douglas Anderson 2020-05-04  846  		/* Another CPU must be u=
p */
d2a8cfc6f32026 Douglas Anderson 2020-05-04  847  		return NOTIFY_OK;
985427f997b6a3 Maulik Shah      2020-04-12  848  	}
985427f997b6a3 Maulik Shah      2020-04-12  849  =

d2a8cfc6f32026 Douglas Anderson 2020-05-04  850  	if (ret =3D=3D NOTIFY_BAD=
) {
d2a8cfc6f32026 Douglas Anderson 2020-05-04  851  		/* Double-check if we're=
 here because someone else is up */
d2a8cfc6f32026 Douglas Anderson 2020-05-04  852  		if (cpus_in_pm < num_onl=
ine_cpus())
985427f997b6a3 Maulik Shah      2020-04-12  853  			ret =3D NOTIFY_OK;
d2a8cfc6f32026 Douglas Anderson 2020-05-04  854  		else
c45def5d804aba Douglas Anderson 2020-05-04  855  			/* We won't be called w=
/ CPU_PM_ENTER_FAILED */
d2a8cfc6f32026 Douglas Anderson 2020-05-04  856  			atomic_dec(&drv->cpus_i=
n_pm);
d2a8cfc6f32026 Douglas Anderson 2020-05-04  857  	}
c45def5d804aba Douglas Anderson 2020-05-04  858  =

985427f997b6a3 Maulik Shah      2020-04-12  859  	return ret;
985427f997b6a3 Maulik Shah      2020-04-12  860  }
985427f997b6a3 Maulik Shah      2020-04-12  861  =


:::::: The code at line 798 was first introduced by commit
:::::: 985427f997b6a31155cce841eb395d43c64771c5 soc: qcom: rpmh: Invoke rpm=
h_flush() for dirty caches

:::::: TO: Maulik Shah <mkshah@codeaurora.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3823301340739049722==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
d2IBAA==
--===============3823301340739049722==--

