Content-Type: multipart/mixed; boundary="===============0101178075509122923=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 12/17] KVM: x86/xen: handle PV timers oneshot mode
Date: Wed, 09 Mar 2022 10:03:35 +0800
Message-ID: <202203090947.j4l7PjFp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0101178075509122923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220228200552.150406-13-dwmw2@infradead.org>
References: <20220228200552.150406-13-dwmw2@infradead.org>
TO: David Woodhouse <dwmw2@infradead.org>

Hi David,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvm/master]
[also build test WARNING on mst-vhost/linux-next v5.17-rc7 next-20220308]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Woodhouse/KVM-Add-Xe=
n-event-channel-acceleration/20220301-040936
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git master
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m031-20220307 (https://download.01.org/0day-ci/arch=
ive/20220309/202203090947.j4l7PjFp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kvm/xen.c:1029 kvm_xen_hcall_set_timer_op() warn: right shifting m=
ore than type allows 32 vs 50

vim +1029 arch/x86/kvm/xen.c

9e28d0cae6d7075 Joao Martins 2022-02-28  1009  =

9e28d0cae6d7075 Joao Martins 2022-02-28  1010  static bool kvm_xen_hcall_se=
t_timer_op(struct kvm_vcpu *vcpu, uint64_t timeout,
9e28d0cae6d7075 Joao Martins 2022-02-28  1011  				       u64 *r)
9e28d0cae6d7075 Joao Martins 2022-02-28  1012  {
9e28d0cae6d7075 Joao Martins 2022-02-28  1013  	if (!kvm_xen_timer_enabled(=
vcpu))
9e28d0cae6d7075 Joao Martins 2022-02-28  1014  		return false;
9e28d0cae6d7075 Joao Martins 2022-02-28  1015  =

9e28d0cae6d7075 Joao Martins 2022-02-28  1016  	if (timeout) {
9e28d0cae6d7075 Joao Martins 2022-02-28  1017  		uint64_t guest_now =3D get=
_kvmclock_ns(vcpu->kvm);
9e28d0cae6d7075 Joao Martins 2022-02-28  1018  		long delta =3D timeout - g=
uest_now;
9e28d0cae6d7075 Joao Martins 2022-02-28  1019  =

9e28d0cae6d7075 Joao Martins 2022-02-28  1020  		/* Xen has a 'Linux workar=
ound' in do_set_timer_op() which
9e28d0cae6d7075 Joao Martins 2022-02-28  1021  		 * checks for negative abs=
olute timeout values (caused by
9e28d0cae6d7075 Joao Martins 2022-02-28  1022  		 * integer overflow), and =
for values about 13 days in the
9e28d0cae6d7075 Joao Martins 2022-02-28  1023  		 * future (2^50ns) which w=
ould be caused by jiffies
9e28d0cae6d7075 Joao Martins 2022-02-28  1024  		 * overflow. For those cas=
es, it sets the timeout 100ms in
9e28d0cae6d7075 Joao Martins 2022-02-28  1025  		 * the future (not *too* s=
oon, since if a guest really did
9e28d0cae6d7075 Joao Martins 2022-02-28  1026  		 * set a long timeout on p=
urpose we don't want to keep
9e28d0cae6d7075 Joao Martins 2022-02-28  1027  		 * churning CPU time by wa=
king it up).
9e28d0cae6d7075 Joao Martins 2022-02-28  1028  		 */
9e28d0cae6d7075 Joao Martins 2022-02-28 @1029  		if (unlikely((int64_t)time=
out < 0 ||
9e28d0cae6d7075 Joao Martins 2022-02-28  1030  			     (delta > 0 && (uint3=
2_t) (delta >> 50) !=3D 0))) {
9e28d0cae6d7075 Joao Martins 2022-02-28  1031  			delta =3D 100 * NSEC_PER_=
MSEC;
9e28d0cae6d7075 Joao Martins 2022-02-28  1032  			timeout =3D guest_now + d=
elta;
9e28d0cae6d7075 Joao Martins 2022-02-28  1033  		}
9e28d0cae6d7075 Joao Martins 2022-02-28  1034  =

9e28d0cae6d7075 Joao Martins 2022-02-28  1035  		kvm_xen_start_timer(vcpu, =
timeout, delta);
9e28d0cae6d7075 Joao Martins 2022-02-28  1036  	} else {
9e28d0cae6d7075 Joao Martins 2022-02-28  1037  		kvm_xen_stop_timer(vcpu);
9e28d0cae6d7075 Joao Martins 2022-02-28  1038  	}
9e28d0cae6d7075 Joao Martins 2022-02-28  1039  =

9e28d0cae6d7075 Joao Martins 2022-02-28  1040  	*r =3D 0;
9e28d0cae6d7075 Joao Martins 2022-02-28  1041  	return true;
9e28d0cae6d7075 Joao Martins 2022-02-28  1042  }
9e28d0cae6d7075 Joao Martins 2022-02-28  1043  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0101178075509122923==--

