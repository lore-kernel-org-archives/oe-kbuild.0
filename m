Content-Type: multipart/mixed; boundary="===============4554367332512812651=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/nvme/host/core.c:2915:2: warning: Address of local auto-variable assigned to a function parameter.
Date: Sun, 27 Dec 2020 04:44:39 +0800
Message-ID: <202012270431.ACAuRZk1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4554367332512812651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Keith Busch <keith.busch@wdc.com>
CC: Christoph Hellwig <hch@lst.de>
CC: "Matias Bj=C3=B8rling" <matias.bjorling@wdc.com>
CC: "Javier Gonz=C3=A1lez" <javier.gonz@samsung.com>
CC: Himanshu Madhani <himanshu.madhani@oracle.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Hannes Reinecke <hare@suse.de>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>
CC: Daniel Wagner <dwagner@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f838f8d2b694cf9d524dc4423e9dd2db13892f3f
commit: be93e87e780253780df9bb6ecc9bc1199b0d94c3 nvme: support for multiple=
 Command Sets Supported and Effects log pages
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
compiler: c6x-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/netfilter/x_tables.c:1339:22: warning: Variable 'mem' is not assigne=
d a value. [unassignedVariable]
    struct xt_counters *mem;
                        ^
>> net/netfilter/nft_fib.c:144:56: warning: Same expression in both branche=
s of ternary operator. [duplicateExpressionTernary]
     *dreg =3D (priv->flags & NFTA_FIB_F_PRESENT) ? !!index : index;
                                                          ^
--
>> net/ipv4/esp4.c:762:10: warning: Redundant condition: xo. '!xo || (xo &&=
 !(xo->flags&CRYPTO_DONE))' is equivalent to '!xo || !(xo->flags&CRYPTO_DON=
E)' [redundantCondition]
    if (!xo || (xo && !(xo->flags & CRYPTO_DONE)))
            ^
   drivers/nvme/host/core.c:2307:35: warning: Same expression on both sides=
 of '-'. [knownConditionTrueFalse]
    ctrl->ctrl_config |=3D (page_shift - 12) << NVME_CC_MPS_SHIFT;
                                     ^
   drivers/nvme/host/core.c:2284:38: note: 'page_shift' is assigned value '=
12' here.
    unsigned dev_page_min, page_shift =3D 12;
                                        ^
   drivers/nvme/host/core.c:2307:35: note: Same expression on both sides of=
 '-'.
    ctrl->ctrl_config |=3D (page_shift - 12) << NVME_CC_MPS_SHIFT;
                                     ^
   drivers/nvme/host/core.c:2122:26: warning: Shifting signed 32-bit value =
by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    cdw10 |=3D (1 << 30) | (1 << 31); /* PTPL=3D1 */
                            ^
>> drivers/nvme/host/core.c:2915:2: warning: Address of local auto-variable=
 assigned to a function parameter. [autoVariables]
    *log =3D &cel->log;
    ^
--
>> net/mpls/af_mpls.c:759:6: warning: Variable 'err' is reassigned a value =
before the old one has been used. 'break;' missing? [redundantAssignInSwitc=
h]
    err =3D 0;
        ^
   net/mpls/af_mpls.c:721:0: note: Variable 'err' is reassigned a value bef=
ore the old one has been used. 'break;' missing?
    int err =3D -EINVAL;
   ^
   net/mpls/af_mpls.c:759:6: note: Variable 'err' is reassigned a value bef=
ore the old one has been used. 'break;' missing?
    err =3D 0;
        ^
>> net/ipv6/esp6.c:796:10: warning: Redundant condition: xo. '!xo || (xo &&=
 !(xo->flags&CRYPTO_DONE))' is equivalent to '!xo || !(xo->flags&CRYPTO_DON=
E)' [redundantCondition]
    if (!xo || (xo && !(xo->flags & CRYPTO_DONE)))
            ^

vim +2915 drivers/nvme/host/core.c

be93e87e7802537 Keith Busch       2020-06-29  2888  =

be93e87e7802537 Keith Busch       2020-06-29  2889  static int nvme_get_eff=
ects_log(struct nvme_ctrl *ctrl, u8 csi,
be93e87e7802537 Keith Busch       2020-06-29  2890  				struct nvme_effects=
_log **log)
be93e87e7802537 Keith Busch       2020-06-29  2891  {
be93e87e7802537 Keith Busch       2020-06-29  2892  	struct nvme_cel *cel =
=3D nvme_find_cel(ctrl, csi);
84fef62d135b6e4 Keith Busch       2017-11-07  2893  	int ret;
84fef62d135b6e4 Keith Busch       2017-11-07  2894  =

be93e87e7802537 Keith Busch       2020-06-29  2895  	if (cel)
be93e87e7802537 Keith Busch       2020-06-29  2896  		goto out;
84fef62d135b6e4 Keith Busch       2017-11-07  2897  =

be93e87e7802537 Keith Busch       2020-06-29  2898  	cel =3D kzalloc(sizeof=
(*cel), GFP_KERNEL);
be93e87e7802537 Keith Busch       2020-06-29  2899  	if (!cel)
be93e87e7802537 Keith Busch       2020-06-29  2900  		return -ENOMEM;
84fef62d135b6e4 Keith Busch       2017-11-07  2901  =

be93e87e7802537 Keith Busch       2020-06-29  2902  	ret =3D nvme_get_log(c=
trl, NVME_NSID_ALL, NVME_LOG_CMD_EFFECTS, 0, csi,
be93e87e7802537 Keith Busch       2020-06-29  2903  			&cel->log, sizeof(ce=
l->log), 0);
84fef62d135b6e4 Keith Busch       2017-11-07  2904  	if (ret) {
be93e87e7802537 Keith Busch       2020-06-29  2905  		kfree(cel);
84fef62d135b6e4 Keith Busch       2017-11-07  2906  		return ret;
180de0070048340 Christoph Hellwig 2017-06-26  2907  	}
180de0070048340 Christoph Hellwig 2017-06-26  2908  =

be93e87e7802537 Keith Busch       2020-06-29  2909  	cel->csi =3D csi;
be93e87e7802537 Keith Busch       2020-06-29  2910  =

be93e87e7802537 Keith Busch       2020-06-29  2911  	spin_lock(&ctrl->lock);
be93e87e7802537 Keith Busch       2020-06-29  2912  	list_add_tail(&cel->en=
try, &ctrl->cels);
be93e87e7802537 Keith Busch       2020-06-29  2913  	spin_unlock(&ctrl->loc=
k);
be93e87e7802537 Keith Busch       2020-06-29  2914  out:
be93e87e7802537 Keith Busch       2020-06-29 @2915  	*log =3D &cel->log;
be93e87e7802537 Keith Busch       2020-06-29  2916  	return 0;
be93e87e7802537 Keith Busch       2020-06-29  2917  }
be93e87e7802537 Keith Busch       2020-06-29  2918  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4554367332512812651==--

