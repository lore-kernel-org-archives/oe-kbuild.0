Content-Type: multipart/mixed; boundary="===============3736540723460087723=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 62/78] drivers/cxl/region.c:550:26: warning: The expression is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 07 May 2022 22:52:41 +0800
Message-ID: <202205072218.MZwMoA1m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3736540723460087723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   9b688fc651b9d2b633e8d959454670aba1c39162
commit: 2ecd98fe1cb0746e61b6543d93939d87519e2df9 [62/78] cxl/region: Add su=
pport for single switch level
:::::: branch date: 2 months ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220504 (https://download.01.org/0day-ci/arc=
hive/20220507/202205072218.MZwMoA1m-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commi=
t/?id=3D2ecd98fe1cb0746e61b6543d93939d87519e2df9
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/=
cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout 2ecd98fe1cb0746e61b6543d93939d87519e2df9
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   drivers/cxl/region.c:620:6: note: Assuming the condition is false
           if (!is_root_decoder(dev))
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:620:2: note: Taking false branch
           if (!is_root_decoder(dev))
           ^
   drivers/cxl/region.c:623:11: note: Calling 'rootd_valid'
           return !!rootd_valid(cxlr, to_cxl_decoder(dev), false);
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:590:2: note: Taking false branch
           if (!qtg_match(rootd, endpoint))
           ^
   drivers/cxl/region.c:593:7: note: Assuming the condition is true
           if (!cxl_is_pmem_t3(rootd->flags))
                ^
   drivers/cxl/cxl.h:248:3: note: expanded from macro 'cxl_is_pmem_t3'
           (((flags) & (CXL_DECODER_F_TYPE3 | CXL_DECODER_F_PMEM)) =3D=3D  =
           \
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   drivers/cxl/region.c:593:2: note: Taking false branch
           if (!cxl_is_pmem_t3(rootd->flags))
           ^
   drivers/cxl/region.c:596:7: note: Calling 'region_xhb_config_valid'
           if (!region_xhb_config_valid(cxlr, rootd))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:262:32: note: Assuming 'i' is not equal to 0
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
                                         ^
   include/linux/dev_printk.h:274:12: note: expanded from macro 'dev_WARN_O=
NCE'
           WARN_ONCE(condition, "%s %s: " format, \
                     ^~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   drivers/cxl/region.c:262:6: note: '__ret_do_once' is false
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
               ^
   include/linux/dev_printk.h:274:2: note: expanded from macro 'dev_WARN_ON=
CE'
           WARN_ONCE(condition, "%s %s: " format, \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:17:16: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                ^~~~~~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/cxl/region.c:262:6: note: Left side of '&&' is false
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
               ^
   include/linux/dev_printk.h:274:2: note: expanded from macro 'dev_WARN_ON=
CE'
           WARN_ONCE(condition, "%s %s: " format, \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   drivers/cxl/region.c:262:6: note: Taking false branch
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
               ^
   include/linux/dev_printk.h:274:2: note: expanded from macro 'dev_WARN_ON=
CE'
           WARN_ONCE(condition, "%s %s: " format, \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   drivers/cxl/region.c:262:2: note: Taking false branch
           if (dev_WARN_ONCE(&cxlr->dev, i =3D=3D 0, "Cannot find a valid h=
ost bridge\n"))
           ^
   drivers/cxl/region.c:266:6: note: Assuming 'i' is not equal to 1
           if (i =3D=3D 1)
               ^~~~~~
   drivers/cxl/region.c:266:2: note: Taking false branch
           if (i =3D=3D 1)
           ^
   drivers/cxl/region.c:270:6: note: 'rootd_ig' is >=3D 'cxlr_ig'
           if (rootd_ig < cxlr_ig) {
               ^~~~~~~~
   drivers/cxl/region.c:270:2: note: Taking false branch
           if (rootd_ig < cxlr_ig) {
           ^
   drivers/cxl/region.c:283:10: note: The result of the left shift is undef=
ined due to shifting by '247', which is greater or equal to the width of ty=
pe 'int'
           if (((1 << (rootd_ig - cxlr_ig)) * (1 << rootd_eniw)) > cxlr_iw)=
 {
                   ^  ~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:311:26: warning: Value stored to 'parent_port' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct cxl_port *port, *parent_port =3D port =3D ep->port;
                                   ^~~~~~~~~~~          ~~~~~~~~
   drivers/cxl/region.c:311:26: note: Value stored to 'parent_port' during =
its initialization is never read
           struct cxl_port *port, *parent_port =3D port =3D ep->port;
                                   ^~~~~~~~~~~          ~~~~~~~~
>> drivers/cxl/region.c:550:26: warning: The expression is an uninitialized=
 value. The computed value will also be garbage [clang-analyzer-core.uninit=
ialized.Assign]
                                           switch_cxld->target[target_ndx++=
] =3D target;
                                                               ^~~~~~~~~~
   drivers/cxl/region.c:439:2: note: Taking false branch
           if (has_multi_switch(cxlr))
           ^
   drivers/cxl/region.c:443:23: note: Left side of '&&' is false
           if (has_switch(cxlr) && !is_power_of_2(region_ways(cxlr)))
                                ^
   drivers/cxl/region.c:450:6: note: 'num_root_ports' is not equal to 1
           if (num_root_ports =3D=3D 1 && !has_switch(cxlr) && state_update)
               ^~~~~~~~~~~~~~
   drivers/cxl/region.c:450:26: note: Left side of '&&' is false
           if (num_root_ports =3D=3D 1 && !has_switch(cxlr) && state_update)
                                   ^
   drivers/cxl/region.c:453:14: note: Assuming 'i' is < 'hb_count'
           for (i =3D 0; i < hb_count; i++) {
                       ^~~~~~~~~~~~
   drivers/cxl/region.c:453:2: note: Loop condition is true.  Entering loop=
 body
           for (i =3D 0; i < hb_count; i++) {
           ^
   drivers/cxl/region.c:462:7: note: Assuming 'state_update' is true
                   if (state_update) {
                       ^~~~~~~~~~~~
   drivers/cxl/region.c:462:3: note: Taking true branch
                   if (state_update) {
                   ^
   drivers/cxl/region.c:464:4: note: Taking false branch
                           if (IS_ERR(cxld)) {
                           ^
   drivers/cxl/region.c:482:26: note: '?' condition is false
                   position_mask =3D (1 << (ilog2(num_root_ports))) - 1;
                                          ^
   include/linux/log2.h:158:2: note: expanded from macro 'ilog2'
           __builtin_constant_p(n) ?       \
           ^
   drivers/cxl/region.c:482:26: note: '?' condition is true
                   position_mask =3D (1 << (ilog2(num_root_ports))) - 1;
                                          ^
   include/linux/log2.h:161:2: note: expanded from macro 'ilog2'
           (sizeof(n) <=3D 4) ?              \
           ^
   drivers/cxl/region.c:493:3: note: Loop condition is true.  Entering loop=
 body
                   list_for_each_entry(rp, &hb->dports, list) {
                   ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/cxl/region.c:496:4: note: 'target_ndx' declared without an initi=
al value
                           int target_ndx;
                           ^~~~~~~~~~~~~~
   drivers/cxl/region.c:498:43: note: Assuming 'idx' is < field 'interleave=
_ways'
                           for_each_cxl_endpoint_hb(ep, cxlr, hb, idx) {
                                                                  ^
   drivers/cxl/region.c:42:7: note: expanded from macro 'for_each_cxl_endpo=
int_hb'
                idx < region_ways(region);                                 =
       \
                ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:498:4: note: Loop condition is true.  Entering loop=
 body
                           for_each_cxl_endpoint_hb(ep, cxlr, hb, idx) {
                           ^
   drivers/cxl/region.c:41:2: note: expanded from macro 'for_each_cxl_endpo=
int_hb'
           for (idx =3D 0, (ep) =3D (region)->config.targets[idx];         =
           \
           ^
   drivers/cxl/region.c:498:4: note: Assuming the condition is true
                           for_each_cxl_endpoint_hb(ep, cxlr, hb, idx) {
                           ^
   drivers/cxl/region.c:44:7: note: expanded from macro 'for_each_cxl_endpo=
int_hb'
                   if (get_hostbridge(ep) =3D=3D (hb))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:498:4: note: Taking true branch
                           for_each_cxl_endpoint_hb(ep, cxlr, hb, idx) {
                           ^
   drivers/cxl/region.c:44:3: note: expanded from macro 'for_each_cxl_endpo=
int_hb'
                   if (get_hostbridge(ep) =3D=3D (hb))
                   ^
   drivers/cxl/region.c:504:9: note: Assuming the condition is false
                                   if (get_rp(ep) !=3D rp)
                                       ^~~~~~~~~~~~~~~~
   drivers/cxl/region.c:504:5: note: Taking false branch
                                   if (get_rp(ep) !=3D rp)
                                   ^
   drivers/cxl/region.c:507:5: note: Taking true branch
                                   if (port_grouping =3D=3D -1)
                                   ^
   drivers/cxl/region.c:514:5: note: Taking false branch
                                   if ((idx & position_mask) !=3D port_grou=
ping) {
                                   ^
   drivers/cxl/region.c:520:10: note: 'state_update' is true
                                   if (!state_update)
                                        ^~~~~~~~~~~~
   drivers/cxl/region.c:520:5: note: Taking false branch
                                   if (!state_update)
                                   ^
   drivers/cxl/region.c:524:9: note: Assuming 'port_grouping' is < field 'n=
r_targets'
                                                     port_grouping >=3D cxl=
d->nr_targets,
                                                     ^
   include/linux/dev_printk.h:274:12: note: expanded from macro 'dev_WARN_O=
NCE'
           WARN_ONCE(condition, "%s %s: " format, \
                     ^~~~~~~~~
   include/asm-generic/bug.h:150:18: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)

vim +550 drivers/cxl/region.c

b15cb12c2369e0 Ben Widawsky 2022-02-11  413  =

786e9e58377374 Ben Widawsky 2022-02-11  414  /**
786e9e58377374 Ben Widawsky 2022-02-11  415   * region_hb_rp_config_valid()=
 - determine root port ordering is correct
786e9e58377374 Ben Widawsky 2022-02-11  416   * @cxlr: Region to validate
786e9e58377374 Ben Widawsky 2022-02-11  417   * @rootd: root decoder for th=
is @cxlr
b15cb12c2369e0 Ben Widawsky 2022-02-11  418   * @state_update: Whether or n=
ot to update port state
786e9e58377374 Ben Widawsky 2022-02-11  419   *
786e9e58377374 Ben Widawsky 2022-02-11  420   * The algorithm is outlined i=
n 2.13.15 "Verify HB root port configuration
786e9e58377374 Ben Widawsky 2022-02-11  421   * sequence" of the CXL Memory=
 Device SW Guide (Rev1p0).
786e9e58377374 Ben Widawsky 2022-02-11  422   *
786e9e58377374 Ben Widawsky 2022-02-11  423   * Returns true if the configu=
ration is valid.
786e9e58377374 Ben Widawsky 2022-02-11  424   */
b15cb12c2369e0 Ben Widawsky 2022-02-11  425  static bool region_hb_rp_confi=
g_valid(struct cxl_region *cxlr,
b15cb12c2369e0 Ben Widawsky 2022-02-11  426  				      const struct cxl_dec=
oder *rootd,
b15cb12c2369e0 Ben Widawsky 2022-02-11  427  				      bool state_update)
786e9e58377374 Ben Widawsky 2022-02-11  428  {
2ecd98fe1cb074 Ben Widawsky 2022-02-11  429  	const int region_ig =3D cxl_t=
o_ig(cxlr->config.interleave_granularity);
2ecd98fe1cb074 Ben Widawsky 2022-02-11  430  	const int region_eniw =3D cxl=
_to_eniw(cxlr->config.interleave_ways);
8ed598d187016c Ben Widawsky 2022-02-11  431  	const int num_root_ports =3D =
get_num_root_ports(cxlr);
8ed598d187016c Ben Widawsky 2022-02-11  432  	struct cxl_port *hbs[CXL_DECO=
DER_MAX_INTERLEAVE];
b15cb12c2369e0 Ben Widawsky 2022-02-11  433  	struct cxl_decoder *cxld, *c;
8ed598d187016c Ben Widawsky 2022-02-11  434  	int hb_count, i;
8ed598d187016c Ben Widawsky 2022-02-11  435  =

8ed598d187016c Ben Widawsky 2022-02-11  436  	hb_count =3D get_unique_hostb=
ridges(cxlr, hbs);
8ed598d187016c Ben Widawsky 2022-02-11  437  =

2ecd98fe1cb074 Ben Widawsky 2022-02-11  438  	/* TODO: support multiple lev=
els of switches */
2ecd98fe1cb074 Ben Widawsky 2022-02-11  439  	if (has_multi_switch(cxlr))
2ecd98fe1cb074 Ben Widawsky 2022-02-11  440  		return false;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  441  =

2ecd98fe1cb074 Ben Widawsky 2022-02-11  442  	/* TODO: x3 interleave for sw=
itches is hard. */
2ecd98fe1cb074 Ben Widawsky 2022-02-11  443  	if (has_switch(cxlr) && !is_p=
ower_of_2(region_ways(cxlr)))
8ed598d187016c Ben Widawsky 2022-02-11  444  		return false;
8ed598d187016c Ben Widawsky 2022-02-11  445  =

8ed598d187016c Ben Widawsky 2022-02-11  446  	/*
8ed598d187016c Ben Widawsky 2022-02-11  447  	 * Are all devices in this re=
gion on the same CXL Host Bridge
8ed598d187016c Ben Widawsky 2022-02-11  448  	 * Root Port?
8ed598d187016c Ben Widawsky 2022-02-11  449  	 */
b15cb12c2369e0 Ben Widawsky 2022-02-11  450  	if (num_root_ports =3D=3D 1 &=
& !has_switch(cxlr) && state_update)
b15cb12c2369e0 Ben Widawsky 2022-02-11  451  		return simple_config(cxlr, h=
bs[0]);
8ed598d187016c Ben Widawsky 2022-02-11  452  =

8ed598d187016c Ben Widawsky 2022-02-11  453  	for (i =3D 0; i < hb_count; i=
++) {
a87877add7dded Ben Widawsky 2022-02-11  454  		struct cxl_decoder *cxld;
8ed598d187016c Ben Widawsky 2022-02-11  455  		int idx, position_mask;
8ed598d187016c Ben Widawsky 2022-02-11  456  		struct cxl_dport *rp;
8ed598d187016c Ben Widawsky 2022-02-11  457  		struct cxl_port *hb;
8ed598d187016c Ben Widawsky 2022-02-11  458  =

8ed598d187016c Ben Widawsky 2022-02-11  459  		/* Get next CXL Host Bridge =
this region spans */
8ed598d187016c Ben Widawsky 2022-02-11  460  		hb =3D hbs[i];
8ed598d187016c Ben Widawsky 2022-02-11  461  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  462  		if (state_update) {
b15cb12c2369e0 Ben Widawsky 2022-02-11  463  			cxld =3D get_decoder(cxlr, =
hb);
b15cb12c2369e0 Ben Widawsky 2022-02-11  464  			if (IS_ERR(cxld)) {
b15cb12c2369e0 Ben Widawsky 2022-02-11  465  				dev_dbg(&cxlr->dev,
b15cb12c2369e0 Ben Widawsky 2022-02-11  466  					"Couldn't get decoder for=
 %s\n",
b15cb12c2369e0 Ben Widawsky 2022-02-11  467  					dev_name(&hb->dev));
b15cb12c2369e0 Ben Widawsky 2022-02-11  468  				goto err;
b15cb12c2369e0 Ben Widawsky 2022-02-11  469  			}
b15cb12c2369e0 Ben Widawsky 2022-02-11  470  			cxld->interleave_ways =3D 0;
b15cb12c2369e0 Ben Widawsky 2022-02-11  471  			cxld->interleave_granularit=
y =3D region_granularity(cxlr);
b15cb12c2369e0 Ben Widawsky 2022-02-11  472  		} else {
b15cb12c2369e0 Ben Widawsky 2022-02-11  473  			cxld =3D NULL;
b15cb12c2369e0 Ben Widawsky 2022-02-11  474  		}
b15cb12c2369e0 Ben Widawsky 2022-02-11  475  =

8ed598d187016c Ben Widawsky 2022-02-11  476  		/*
8ed598d187016c Ben Widawsky 2022-02-11  477  		 * Calculate the position ma=
sk: NumRootPorts =3D 2^PositionMask
8ed598d187016c Ben Widawsky 2022-02-11  478  		 * for this region.
8ed598d187016c Ben Widawsky 2022-02-11  479  		 *
8ed598d187016c Ben Widawsky 2022-02-11  480  		 * XXX: pos_mask is actually=
 (1 << PositionMask)  - 1
8ed598d187016c Ben Widawsky 2022-02-11  481  		 */
8ed598d187016c Ben Widawsky 2022-02-11  482  		position_mask =3D (1 << (ilo=
g2(num_root_ports))) - 1;
8ed598d187016c Ben Widawsky 2022-02-11  483  =

8ed598d187016c Ben Widawsky 2022-02-11  484  		/*
8ed598d187016c Ben Widawsky 2022-02-11  485  		 * Calculate the PortGroupin=
g for each device on this CXL Host
8ed598d187016c Ben Widawsky 2022-02-11  486  		 * Bridge Root Port:
8ed598d187016c Ben Widawsky 2022-02-11  487  		 * PortGrouping =3D RegionLa=
bel.Position & PositionMask
8ed598d187016c Ben Widawsky 2022-02-11  488  		 *
8ed598d187016c Ben Widawsky 2022-02-11  489  		 * The following nest iterat=
ors effectively iterate over each
8ed598d187016c Ben Widawsky 2022-02-11  490  		 * root port in the region.
8ed598d187016c Ben Widawsky 2022-02-11  491  		 *   for_each_unique_rootpor=
t(rp, cxlr)
8ed598d187016c Ben Widawsky 2022-02-11  492  		 */
8ed598d187016c Ben Widawsky 2022-02-11  493  		list_for_each_entry(rp, &hb-=
>dports, list) {
8ed598d187016c Ben Widawsky 2022-02-11  494  			struct cxl_memdev *ep;
8ed598d187016c Ben Widawsky 2022-02-11  495  			int port_grouping =3D -1;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  496  			int target_ndx;
8ed598d187016c Ben Widawsky 2022-02-11  497  =

8ed598d187016c Ben Widawsky 2022-02-11  498  			for_each_cxl_endpoint_hb(ep=
, cxlr, hb, idx) {
2ecd98fe1cb074 Ben Widawsky 2022-02-11  499  				struct cxl_decoder *switch=
_cxld;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  500  				struct cxl_dport *target;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  501  				struct cxl_port *switch_po=
rt;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  502  				bool found =3D false;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  503  =

8ed598d187016c Ben Widawsky 2022-02-11  504  				if (get_rp(ep) !=3D rp)
8ed598d187016c Ben Widawsky 2022-02-11  505  					continue;
8ed598d187016c Ben Widawsky 2022-02-11  506  =

8ed598d187016c Ben Widawsky 2022-02-11  507  				if (port_grouping =3D=3D -=
1)
8ed598d187016c Ben Widawsky 2022-02-11  508  					port_grouping =3D idx & p=
osition_mask;
8ed598d187016c Ben Widawsky 2022-02-11  509  =

8ed598d187016c Ben Widawsky 2022-02-11  510  				/*
8ed598d187016c Ben Widawsky 2022-02-11  511  				 * Do all devices in the r=
egion connected to this CXL
8ed598d187016c Ben Widawsky 2022-02-11  512  				 * Host Bridge Root Port h=
ave the same PortGrouping?
8ed598d187016c Ben Widawsky 2022-02-11  513  				 */
8ed598d187016c Ben Widawsky 2022-02-11  514  				if ((idx & position_mask) =
!=3D port_grouping) {
8ed598d187016c Ben Widawsky 2022-02-11  515  					dev_dbg(&cxlr->dev,
8ed598d187016c Ben Widawsky 2022-02-11  516  						"One or more devices are=
 not connected to the correct Host Bridge Root Port\n");
b15cb12c2369e0 Ben Widawsky 2022-02-11  517  					goto err;
8ed598d187016c Ben Widawsky 2022-02-11  518  				}
a87877add7dded Ben Widawsky 2022-02-11  519  =

a87877add7dded Ben Widawsky 2022-02-11  520  				if (!state_update)
a87877add7dded Ben Widawsky 2022-02-11  521  					continue;
a87877add7dded Ben Widawsky 2022-02-11  522  =

a87877add7dded Ben Widawsky 2022-02-11  523  				if (dev_WARN_ONCE(&cxld->d=
ev,
a87877add7dded Ben Widawsky 2022-02-11  524  						  port_grouping >=3D cxl=
d->nr_targets,
a87877add7dded Ben Widawsky 2022-02-11  525  						  "Invalid port grouping=
 %d/%d\n",
a87877add7dded Ben Widawsky 2022-02-11  526  						  port_grouping, cxld->n=
r_targets))
a87877add7dded Ben Widawsky 2022-02-11  527  					goto err;
a87877add7dded Ben Widawsky 2022-02-11  528  =

a87877add7dded Ben Widawsky 2022-02-11  529  				cxld->interleave_ways++;
a87877add7dded Ben Widawsky 2022-02-11  530  				cxld->target[port_grouping=
] =3D get_rp(ep);
2ecd98fe1cb074 Ben Widawsky 2022-02-11  531  =

2ecd98fe1cb074 Ben Widawsky 2022-02-11  532  				/*
2ecd98fe1cb074 Ben Widawsky 2022-02-11  533  				 * At least one switch is =
connected here if the endpoint
2ecd98fe1cb074 Ben Widawsky 2022-02-11  534  				 * has a depth > 2
2ecd98fe1cb074 Ben Widawsky 2022-02-11  535  				 */
2ecd98fe1cb074 Ben Widawsky 2022-02-11  536  				if (ep->port->depth =3D=3D=
 2)
2ecd98fe1cb074 Ben Widawsky 2022-02-11  537  					continue;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  538  =

2ecd98fe1cb074 Ben Widawsky 2022-02-11  539  				/* Check the staged list t=
o see if this
2ecd98fe1cb074 Ben Widawsky 2022-02-11  540  				 * port has already been a=
dded
2ecd98fe1cb074 Ben Widawsky 2022-02-11  541  				 */
2ecd98fe1cb074 Ben Widawsky 2022-02-11  542  				switch_port =3D get_switch=
(ep);
2ecd98fe1cb074 Ben Widawsky 2022-02-11  543  				list_for_each_entry(switch=
_cxld, &cxlr->staged_list, region_link) {
2ecd98fe1cb074 Ben Widawsky 2022-02-11  544  					if (to_cxl_port(switch_cx=
ld->dev.parent) =3D=3D switch_port)
2ecd98fe1cb074 Ben Widawsky 2022-02-11  545  						found =3D true;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  546  				}
2ecd98fe1cb074 Ben Widawsky 2022-02-11  547  =

2ecd98fe1cb074 Ben Widawsky 2022-02-11  548  				if (found) {
2ecd98fe1cb074 Ben Widawsky 2022-02-11  549  					target =3D cxl_find_dport=
_by_dev(switch_port, ep->dev.parent->parent);
2ecd98fe1cb074 Ben Widawsky 2022-02-11 @550  					switch_cxld->target[targe=
t_ndx++] =3D target;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  551  					continue;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  552  				}
2ecd98fe1cb074 Ben Widawsky 2022-02-11  553  =

2ecd98fe1cb074 Ben Widawsky 2022-02-11  554  				target_ndx =3D 0;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  555  =

2ecd98fe1cb074 Ben Widawsky 2022-02-11  556  				switch_cxld =3D get_decode=
r(cxlr, switch_port);
2ecd98fe1cb074 Ben Widawsky 2022-02-11  557  				switch_cxld->interleave_wa=
ys++;
2ecd98fe1cb074 Ben Widawsky 2022-02-11  558  				switch_cxld->interleave_gr=
anularity =3D cxl_to_ways(region_ig + region_eniw);
8ed598d187016c Ben Widawsky 2022-02-11  559  			}
8ed598d187016c Ben Widawsky 2022-02-11  560  		}
8ed598d187016c Ben Widawsky 2022-02-11  561  	}
8ed598d187016c Ben Widawsky 2022-02-11  562  =

786e9e58377374 Ben Widawsky 2022-02-11  563  	return true;
b15cb12c2369e0 Ben Widawsky 2022-02-11  564  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  565  err:
b15cb12c2369e0 Ben Widawsky 2022-02-11  566  	dev_dbg(&cxlr->dev, "Couldn't=
 get decoder for region\n");
b15cb12c2369e0 Ben Widawsky 2022-02-11  567  	list_for_each_entry_safe(cxld=
, c, &cxlr->staged_list, region_link)
b15cb12c2369e0 Ben Widawsky 2022-02-11  568  		cxl_put_decoder(cxld);
b15cb12c2369e0 Ben Widawsky 2022-02-11  569  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  570  	return false;
786e9e58377374 Ben Widawsky 2022-02-11  571  }
786e9e58377374 Ben Widawsky 2022-02-11  572  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3736540723460087723==--

