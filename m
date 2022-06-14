Content-Type: multipart/mixed; boundary="===============4312025318113585826=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jimc:ddn3f 23/23] lib/dynamic_debug.c:731 param_set_dyndbg_classes() error: uninitialized symbol 'i'.
Date: Wed, 15 Jun 2022 07:02:11 +0800
Message-ID: <202206150631.dn9D6jac-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4312025318113585826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git ddn3f
head:   8b979e42bc4bc001aeee88f11787c944c00e909c
commit: 8b979e42bc4bc001aeee88f11787c944c00e909c [23/23] drop loop calling =
do_cb_changes
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-m001-20220613 (https://download.01.org/0day-ci/ar=
chive/20220615/202206150631.dn9D6jac-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
lib/dynamic_debug.c:731 param_set_dyndbg_classes() error: uninitialized sym=
bol 'i'.

Old smatch warnings:
lib/dynamic_debug.c:732 param_set_dyndbg_classes() error: uninitialized sym=
bol 'i'.

vim +/i +731 lib/dynamic_debug.c

af486d3610e6e57 Jim Cromie 2022-04-06  699  =

5ef1ab46f824c31 Jim Cromie 2022-04-01  700  /**
5ef1ab46f824c31 Jim Cromie 2022-04-01  701   * param_set_dyndbg_classes - b=
its =3D> categories >control setter
5ef1ab46f824c31 Jim Cromie 2022-04-01  702   * @instr: string echo>d to sys=
fs
5ef1ab46f824c31 Jim Cromie 2022-04-01  703   * @kp:    kp->arg has state: b=
its, map
5ef1ab46f824c31 Jim Cromie 2022-04-01  704   *
5ef1ab46f824c31 Jim Cromie 2022-04-01  705   * Enable/disable prdbgs by the=
ir "category", as specified in the
5ef1ab46f824c31 Jim Cromie 2022-04-01  706   * arguments to DYNAMIC_DEBUG_C=
LASSES.
5ef1ab46f824c31 Jim Cromie 2022-04-01  707   *
5ef1ab46f824c31 Jim Cromie 2022-04-01  708   * Returns: 0 or <0 if error.
5ef1ab46f824c31 Jim Cromie 2022-04-01  709   */
5ef1ab46f824c31 Jim Cromie 2022-04-01  710  int param_set_dyndbg_classes(co=
nst char *instr, const struct kernel_param *kp)
5ef1ab46f824c31 Jim Cromie 2022-04-01  711  {
5ef1ab46f824c31 Jim Cromie 2022-04-01  712  	const struct ddebug_classes_bi=
tmap_param *dcp =3D kp->arg;
5ef1ab46f824c31 Jim Cromie 2022-04-01  713  	unsigned long inbits;
5ef1ab46f824c31 Jim Cromie 2022-04-01  714  	int rc, i, totct =3D 0;
5ef1ab46f824c31 Jim Cromie 2022-04-01  715  =

5ef1ab46f824c31 Jim Cromie 2022-04-01  716  	if (!dcp || !dcp->map) {
5ef1ab46f824c31 Jim Cromie 2022-04-01  717  		pr_err("set_dyndbg_classes: n=
o bits=3D>queries map\n");
5ef1ab46f824c31 Jim Cromie 2022-04-01  718  		return -EINVAL;
5ef1ab46f824c31 Jim Cromie 2022-04-01  719  	}
5ef1ab46f824c31 Jim Cromie 2022-04-01  720  	rc =3D kstrtoul(instr, 0, &inb=
its);
af486d3610e6e57 Jim Cromie 2022-04-06  721  	if (rc)
af486d3610e6e57 Jim Cromie 2022-04-06  722  		return param_set_dyndbg_class=
_strings(instr, kp);
af486d3610e6e57 Jim Cromie 2022-04-06  723  =

5ef1ab46f824c31 Jim Cromie 2022-04-01  724  	vpr_info("set_dyndbg_classes: =
0x%lx =3D> 0x%lx\n", *dcp->bits, inbits);
5ef1ab46f824c31 Jim Cromie 2022-04-01  725  =

99e627f4b95fae1 Jim Cromie 2022-06-07  726  	/* force bits if sysfs-node is=
 for a VERBOSE class-map */
99e627f4b95fae1 Jim Cromie 2022-06-07  727  	if (dcp->map->map_type =3D=3D =
DD_CLS_VERBOSE) {
99e627f4b95fae1 Jim Cromie 2022-06-07  728  		inbits =3D (1 << (inbits + 1)=
) - 1;
99e627f4b95fae1 Jim Cromie 2022-06-07  729  	}
99e627f4b95fae1 Jim Cromie 2022-06-07  730  =

af486d3610e6e57 Jim Cromie 2022-04-06 @731  	vpr_info("set_dyndbg_classes: =
bit %d: %s\n", i, dcp->map->class_names[i]);
5ef1ab46f824c31 Jim Cromie 2022-04-01  732  	totct +=3D do_callback_changes=
(dcp, i, &inbits);
8b979e42bc4bc00 Jim Cromie 2022-06-07  733  =

5ef1ab46f824c31 Jim Cromie 2022-04-01  734  	*dcp->bits =3D inbits;
5ef1ab46f824c31 Jim Cromie 2022-04-01  735  	vpr_info("total matches: %d\n"=
, totct);
5ef1ab46f824c31 Jim Cromie 2022-04-01  736  	return 0;
5ef1ab46f824c31 Jim Cromie 2022-04-01  737  }
5ef1ab46f824c31 Jim Cromie 2022-04-01  738  EXPORT_SYMBOL(param_set_dyndbg_=
classes);
5ef1ab46f824c31 Jim Cromie 2022-04-01  739  =


:::::: The code at line 731 was first introduced by commit
:::::: af486d3610e6e5743398b4000282d155c7475bd1 dyndbg: support symbolic cl=
ass-names in bitmap

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4312025318113585826==--

