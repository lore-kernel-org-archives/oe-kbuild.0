Content-Type: multipart/mixed; boundary="===============5969469516620855768=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 12/18] KVM: arm64: Support SDEI event injection, delivery
Date: Mon, 04 Apr 2022 20:43:22 +0800
Message-ID: <202204042058.SDC4Q1mB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5969469516620855768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220403153911.12332-13-gshan@redhat.com>
References: <20220403153911.12332-13-gshan@redhat.com>
TO: Gavin Shan <gshan@redhat.com>
TO: kvmarm(a)lists.cs.columbia.edu
CC: linux-kernel(a)vger.kernel.org
CC: eauger(a)redhat.com
CC: oupton(a)google.com
CC: Jonathan.Cameron(a)huawei.com
CC: vkuznets(a)redhat.com
CC: will(a)kernel.org
CC: shannon.zhaosl(a)gmail.com
CC: james.morse(a)arm.com
CC: mark.rutland(a)arm.com
CC: maz(a)kernel.org
CC: pbonzini(a)redhat.com
CC: shan.gavin(a)gmail.com

Hi Gavin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc1 next-20220404]
[cannot apply to kvmarm/next kvm/master linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gavin-Shan/Support-S=
DEI-Virtualization/20220403-234350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-c004-20220404 (https://download.01.org/0day-ci/arc=
hive/20220404/202204042058.SDC4Q1mB-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/sdei.c:530:3-9: preceding lock on line 500

vim +530 arch/arm64/kvm/sdei.c

4a1a288d49e756 Gavin Shan 2022-04-03  479  =

2c24bc7163ddb2 Gavin Shan 2022-04-03  480  int kvm_sdei_inject_event(struct=
 kvm_vcpu *vcpu,
2c24bc7163ddb2 Gavin Shan 2022-04-03  481  			  unsigned int num,
2c24bc7163ddb2 Gavin Shan 2022-04-03  482  			  bool immediate)
2c24bc7163ddb2 Gavin Shan 2022-04-03  483  {
2c24bc7163ddb2 Gavin Shan 2022-04-03  484  	struct kvm_sdei_vcpu *vsdei =3D=
 vcpu->arch.sdei;
2c24bc7163ddb2 Gavin Shan 2022-04-03  485  	struct kvm_sdei_exposed_event *=
exposed_event;
2c24bc7163ddb2 Gavin Shan 2022-04-03  486  	struct kvm_sdei_event *event;
2c24bc7163ddb2 Gavin Shan 2022-04-03  487  	unsigned long event_count =3D 0;
2c24bc7163ddb2 Gavin Shan 2022-04-03  488  	int ret =3D 0;
2c24bc7163ddb2 Gavin Shan 2022-04-03  489  =

2c24bc7163ddb2 Gavin Shan 2022-04-03  490  	if (!vsdei) {
2c24bc7163ddb2 Gavin Shan 2022-04-03  491  		ret =3D -EPERM;
2c24bc7163ddb2 Gavin Shan 2022-04-03  492  		goto out;
2c24bc7163ddb2 Gavin Shan 2022-04-03  493  	}
2c24bc7163ddb2 Gavin Shan 2022-04-03  494  =

2c24bc7163ddb2 Gavin Shan 2022-04-03  495  	if (!kvm_sdei_is_supported(num)=
) {
2c24bc7163ddb2 Gavin Shan 2022-04-03  496  		ret =3D -EINVAL;
2c24bc7163ddb2 Gavin Shan 2022-04-03  497  		goto out;
2c24bc7163ddb2 Gavin Shan 2022-04-03  498  	}
2c24bc7163ddb2 Gavin Shan 2022-04-03  499  =

2c24bc7163ddb2 Gavin Shan 2022-04-03 @500  	spin_lock(&vsdei->lock);
2c24bc7163ddb2 Gavin Shan 2022-04-03  501  =

2c24bc7163ddb2 Gavin Shan 2022-04-03  502  	/* Check if the vcpu has been m=
asked */
2c24bc7163ddb2 Gavin Shan 2022-04-03  503  	if (vsdei->masked) {
2c24bc7163ddb2 Gavin Shan 2022-04-03  504  		ret =3D -EPERM;
2c24bc7163ddb2 Gavin Shan 2022-04-03  505  		goto unlock;
2c24bc7163ddb2 Gavin Shan 2022-04-03  506  	}
2c24bc7163ddb2 Gavin Shan 2022-04-03  507  =

2c24bc7163ddb2 Gavin Shan 2022-04-03  508  	/* Check if the event exists */
2c24bc7163ddb2 Gavin Shan 2022-04-03  509  	event =3D find_event(vcpu, num);
2c24bc7163ddb2 Gavin Shan 2022-04-03  510  	if (!event) {
2c24bc7163ddb2 Gavin Shan 2022-04-03  511  		ret =3D -ENOENT;
2c24bc7163ddb2 Gavin Shan 2022-04-03  512  		goto unlock;
2c24bc7163ddb2 Gavin Shan 2022-04-03  513  	}
2c24bc7163ddb2 Gavin Shan 2022-04-03  514  =

2c24bc7163ddb2 Gavin Shan 2022-04-03  515  	/*
2c24bc7163ddb2 Gavin Shan 2022-04-03  516  	 * In some cases, the injected =
event is expected to be delivered
2c24bc7163ddb2 Gavin Shan 2022-04-03  517  	 * immediately. However, there =
are two cases the injected event
2c24bc7163ddb2 Gavin Shan 2022-04-03  518  	 * can't be delivered immediate=
ly: (a) the injected event is a
2c24bc7163ddb2 Gavin Shan 2022-04-03  519  	 * critical one, but we already=
 have pending critical events for
2c24bc7163ddb2 Gavin Shan 2022-04-03  520  	 * delivery. (b) the injected e=
vent is a normal one, but we have
2c24bc7163ddb2 Gavin Shan 2022-04-03  521  	 * pending events for delivery,=
 regardless of their priorities.
2c24bc7163ddb2 Gavin Shan 2022-04-03  522  	 */
2c24bc7163ddb2 Gavin Shan 2022-04-03  523  	if (immediate) {
2c24bc7163ddb2 Gavin Shan 2022-04-03  524  		exposed_event =3D event->expos=
ed_event;
2c24bc7163ddb2 Gavin Shan 2022-04-03  525  		event_count =3D vsdei->critica=
l_event_count;
2c24bc7163ddb2 Gavin Shan 2022-04-03  526  		if (kvm_sdei_is_normal(exposed=
_event->priority))
2c24bc7163ddb2 Gavin Shan 2022-04-03  527  			event_count +=3D vsdei->norma=
l_event_count;
2c24bc7163ddb2 Gavin Shan 2022-04-03  528  =

2c24bc7163ddb2 Gavin Shan 2022-04-03  529  		if (event_count > 0)
2c24bc7163ddb2 Gavin Shan 2022-04-03 @530  			return -ENOSPC;
2c24bc7163ddb2 Gavin Shan 2022-04-03  531  	}
2c24bc7163ddb2 Gavin Shan 2022-04-03  532  =

2c24bc7163ddb2 Gavin Shan 2022-04-03  533  	ret =3D inject_event(vcpu, even=
t);
2c24bc7163ddb2 Gavin Shan 2022-04-03  534  =

2c24bc7163ddb2 Gavin Shan 2022-04-03  535  unlock:
2c24bc7163ddb2 Gavin Shan 2022-04-03  536  	spin_unlock(&vsdei->lock);
2c24bc7163ddb2 Gavin Shan 2022-04-03  537  out:
2c24bc7163ddb2 Gavin Shan 2022-04-03  538  	return ret;
2c24bc7163ddb2 Gavin Shan 2022-04-03  539  }
2c24bc7163ddb2 Gavin Shan 2022-04-03  540  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5969469516620855768==--

