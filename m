Content-Type: multipart/mixed; boundary="===============2977275244666846776=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 63/78] drivers/cxl/region.c:698:7: warning: Branch condition evaluates to a garbage value [clang-analyzer-core.uninitialized.Branch]
Date: Sun, 08 May 2022 07:17:26 +0800
Message-ID: <202205080702.50dD2up2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2977275244666846776==
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
commit: 968e6c3d87e25ab658488f054bf46392d360b5cd [63/78] cxl: Program decod=
ers for regions
:::::: branch date: 2 months ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220504 (https://download.01.org/0day-ci/arc=
hive/20220508/202205080702.50dD2up2-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004f=
b787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commi=
t/?id=3D968e6c3d87e25ab658488f054bf46392d360b5cd
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/=
cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout 968e6c3d87e25ab658488f054bf46392d360b5cd
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
                           ^~~~~~~~~
   include/linux/once_lite.h:15:27: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   bool __ret_do_once =3D !!(condition);                   =
  \
                                           ^~~~~~~~~
   drivers/cxl/region.c:523:9: note: '__ret_do_once' is false
                                   if (dev_WARN_ONCE(&cxld->dev,
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
   drivers/cxl/region.c:523:9: note: Left side of '&&' is false
                                   if (dev_WARN_ONCE(&cxld->dev,
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
   drivers/cxl/region.c:523:9: note: Taking false branch
                                   if (dev_WARN_ONCE(&cxld->dev,
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
   drivers/cxl/region.c:523:5: note: Taking false branch
                                   if (dev_WARN_ONCE(&cxld->dev,
                                   ^
   drivers/cxl/region.c:536:9: note: Assuming field 'depth' is not equal to=
 2
                                   if (ep->port->depth =3D=3D 2)
                                       ^~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:536:5: note: Taking false branch
                                   if (ep->port->depth =3D=3D 2)
                                   ^
   drivers/cxl/region.c:543:5: note: Loop condition is true.  Entering loop=
 body
                                   list_for_each_entry(switch_cxld, &cxlr->=
staged_list, region_link) {
                                   ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/cxl/region.c:544:10: note: Assuming the condition is true
                                           if (to_cxl_port(switch_cxld->dev=
.parent) =3D=3D switch_port)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/region.c:544:6: note: Taking true branch
                                           if (to_cxl_port(switch_cxld->dev=
.parent) =3D=3D switch_port)
                                           ^
   drivers/cxl/region.c:543:5: note: Loop condition is false. Execution con=
tinues on line 548
                                   list_for_each_entry(switch_cxld, &cxlr->=
staged_list, region_link) {
                                   ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/cxl/region.c:548:9: note: 'found' is true
                                   if (found) {
                                       ^~~~~
   drivers/cxl/region.c:548:5: note: Taking true branch
                                   if (found) {
                                   ^
   drivers/cxl/region.c:550:26: note: The expression is an uninitialized va=
lue. The computed value will also be garbage
                                           switch_cxld->target[target_ndx++=
] =3D target;
                                                               ^~~~~~~~~~
>> drivers/cxl/region.c:698:7: warning: Branch condition evaluates to a gar=
bage value [clang-analyzer-core.uninitialized.Branch]
                   if (rc) {
                       ^~
   drivers/cxl/region.c:684:2: note: 'rc' declared without an initial value
           int rc;
           ^~~~~~
   drivers/cxl/region.c:686:2: note: Loop condition is false. Execution con=
tinues on line 697
           list_for_each_entry_safe(cxld, d, &cxlr->staged_list, region_lin=
k) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/cxl/region.c:697:2: note: Loop condition is true.  Entering loop=
 body
           list_for_each_entry_safe(cxld, d, &cxlr->commit_list, region_lin=
k) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/cxl/region.c:698:7: note: Branch condition evaluates to a garbag=
e value
                   if (rc) {
                       ^~
   drivers/cxl/region.c:704:6: warning: Branch condition evaluates to a gar=
bage value [clang-analyzer-core.uninitialized.Branch]
           if (rc)
               ^~
   drivers/cxl/region.c:684:2: note: 'rc' declared without an initial value
           int rc;
           ^~~~~~
   drivers/cxl/region.c:686:2: note: Loop condition is false. Execution con=
tinues on line 697
           list_for_each_entry_safe(cxld, d, &cxlr->staged_list, region_lin=
k) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/cxl/region.c:697:2: note: Loop condition is false. Execution con=
tinues on line 704
           list_for_each_entry_safe(cxld, d, &cxlr->commit_list, region_lin=
k) {
           ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/cxl/region.c:704:6: note: Branch condition evaluates to a garbag=
e value
           if (rc)
               ^~
   Suppressed 13 warnings (6 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (7 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   block/blk-mq-cpumap.c:21:33: warning: Division by zero [clang-analyzer-c=
ore.DivideZero]
           return qmap->queue_offset + (q % nr_queues);
                                          ^
   block/blk-mq-cpumap.c:38:2: note: 'nr_queues' initialized here
           unsigned int nr_queues =3D qmap->nr_queues;
           ^~~~~~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:41:2: note: Assuming 'cpu' is >=3D 'nr_cpu_ids'
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:278:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:41:2: note: Loop condition is false. Execution con=
tinues on line 48
           for_each_possible_cpu(cpu)
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)
                                      ^
   include/linux/cpumask.h:276:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   block/blk-mq-cpumap.c:48:2: note: Assuming 'cpu' is >=3D 'nr_cpu_ids'
           for_each_present_cpu(cpu) {
           ^
   include/linux/cpumask.h:816:36: note: expanded from macro 'for_each_pres=
ent_cpu'
   #define for_each_present_cpu(cpu)  for_each_cpu((cpu), cpu_present_mask)
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cpumask.h:278:3: note: expanded from macro 'for_each_cpu'
                   (cpu) < nr_cpu_ids;)
                   ^~~~~~~~~~~~~~~~~~
   block/blk-mq-cpumap.c:48:2: note: Loop condition is false. Execution con=
tinues on line 54
           for_each_present_cpu(cpu) {
           ^
   include/linux/cpumask.h:816:36: note: expanded from macro 'for_each_pres=
ent_cpu'
   #define for_each_present_cpu(cpu)  for_each_cpu((cpu), cpu_present_mask)
                                      ^
   include/linux/cpumask.h:276:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D -1;                                \
           ^
   block/blk-mq-cpumap.c:54:2: note: Assuming 'cpu' is < 'nr_cpu_ids'
           for_each_possible_cpu(cpu) {
           ^
   include/linux/cpumask.h:814:36: note: expanded from macro 'for_each_poss=
ible_cpu'
   #define for_each_possible_cpu(cpu) for_each_cpu((cpu), cpu_possible_mask)

vim +698 drivers/cxl/region.c

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

2ecd98fe1cb074 Ben Widawsky 2022-02-11 @548  				if (found) {
2ecd98fe1cb074 Ben Widawsky 2022-02-11  549  					target =3D cxl_find_dport=
_by_dev(switch_port, ep->dev.parent->parent);
2ecd98fe1cb074 Ben Widawsky 2022-02-11  550  					switch_cxld->target[targe=
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

786e9e58377374 Ben Widawsky 2022-02-11  573  /**
786e9e58377374 Ben Widawsky 2022-02-11  574   * rootd_contains() - determin=
e if this region can exist in the root decoder
786e9e58377374 Ben Widawsky 2022-02-11  575   * @rootd: root decoder that p=
otentially decodes to this region
786e9e58377374 Ben Widawsky 2022-02-11  576   * @cxlr: region to be routed =
by the @rootd
786e9e58377374 Ben Widawsky 2022-02-11  577   */
786e9e58377374 Ben Widawsky 2022-02-11  578  static bool rootd_contains(con=
st struct cxl_region *cxlr,
786e9e58377374 Ben Widawsky 2022-02-11  579  			   const struct cxl_decoder=
 *rootd)
786e9e58377374 Ben Widawsky 2022-02-11  580  {
786e9e58377374 Ben Widawsky 2022-02-11  581  	/* TODO: */
786e9e58377374 Ben Widawsky 2022-02-11  582  	return true;
786e9e58377374 Ben Widawsky 2022-02-11  583  }
786e9e58377374 Ben Widawsky 2022-02-11  584  =

786e9e58377374 Ben Widawsky 2022-02-11  585  static bool rootd_valid(const =
struct cxl_region *cxlr,
b15cb12c2369e0 Ben Widawsky 2022-02-11  586  			const struct cxl_decoder *r=
ootd, bool state_update)
786e9e58377374 Ben Widawsky 2022-02-11  587  {
786e9e58377374 Ben Widawsky 2022-02-11  588  	const struct cxl_memdev *endp=
oint =3D cxlr->config.targets[0];
786e9e58377374 Ben Widawsky 2022-02-11  589  =

786e9e58377374 Ben Widawsky 2022-02-11  590  	if (!qtg_match(rootd, endpoin=
t))
786e9e58377374 Ben Widawsky 2022-02-11  591  		return false;
786e9e58377374 Ben Widawsky 2022-02-11  592  =

786e9e58377374 Ben Widawsky 2022-02-11  593  	if (!cxl_is_pmem_t3(rootd->fl=
ags))
786e9e58377374 Ben Widawsky 2022-02-11  594  		return false;
786e9e58377374 Ben Widawsky 2022-02-11  595  =

786e9e58377374 Ben Widawsky 2022-02-11  596  	if (!region_xhb_config_valid(=
cxlr, rootd))
786e9e58377374 Ben Widawsky 2022-02-11  597  		return false;
786e9e58377374 Ben Widawsky 2022-02-11  598  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  599  	if (!region_hb_rp_config_vali=
d((struct cxl_region *)cxlr, rootd,
b15cb12c2369e0 Ben Widawsky 2022-02-11  600  				       state_update))
786e9e58377374 Ben Widawsky 2022-02-11  601  		return false;
786e9e58377374 Ben Widawsky 2022-02-11  602  =

786e9e58377374 Ben Widawsky 2022-02-11  603  	if (!rootd_contains(cxlr, roo=
td))
786e9e58377374 Ben Widawsky 2022-02-11  604  		return false;
786e9e58377374 Ben Widawsky 2022-02-11  605  =

786e9e58377374 Ben Widawsky 2022-02-11  606  	return true;
786e9e58377374 Ben Widawsky 2022-02-11  607  }
786e9e58377374 Ben Widawsky 2022-02-11  608  =

786e9e58377374 Ben Widawsky 2022-02-11  609  struct rootd_context {
786e9e58377374 Ben Widawsky 2022-02-11  610  	const struct cxl_region *cxlr;
a87877add7dded Ben Widawsky 2022-02-11  611  	const struct cxl_port *hbs[CX=
L_DECODER_MAX_INTERLEAVE];
786e9e58377374 Ben Widawsky 2022-02-11  612  	int count;
786e9e58377374 Ben Widawsky 2022-02-11  613  };
786e9e58377374 Ben Widawsky 2022-02-11  614  =

786e9e58377374 Ben Widawsky 2022-02-11  615  static int rootd_match(struct =
device *dev, void *data)
786e9e58377374 Ben Widawsky 2022-02-11  616  {
786e9e58377374 Ben Widawsky 2022-02-11  617  	struct rootd_context *ctx =3D=
 (struct rootd_context *)data;
786e9e58377374 Ben Widawsky 2022-02-11  618  	const struct cxl_region *cxlr=
 =3D ctx->cxlr;
786e9e58377374 Ben Widawsky 2022-02-11  619  =

786e9e58377374 Ben Widawsky 2022-02-11  620  	if (!is_root_decoder(dev))
786e9e58377374 Ben Widawsky 2022-02-11  621  		return 0;
786e9e58377374 Ben Widawsky 2022-02-11  622  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  623  	return !!rootd_valid(cxlr, to=
_cxl_decoder(dev), false);
786e9e58377374 Ben Widawsky 2022-02-11  624  }
786e9e58377374 Ben Widawsky 2022-02-11  625  =

786e9e58377374 Ben Widawsky 2022-02-11  626  /*
786e9e58377374 Ben Widawsky 2022-02-11  627   * This is a roughly equivalen=
t implementation to "Figure 45 - High-level
786e9e58377374 Ben Widawsky 2022-02-11  628   * sequence: Finding CFMWS for=
 region" from the CXL Memory Device SW Guide
786e9e58377374 Ben Widawsky 2022-02-11  629   * Rev1p0.
786e9e58377374 Ben Widawsky 2022-02-11  630   */
786e9e58377374 Ben Widawsky 2022-02-11  631  static struct cxl_decoder *fin=
d_rootd(const struct cxl_region *cxlr,
786e9e58377374 Ben Widawsky 2022-02-11  632  				      const struct cxl_por=
t *root)
786e9e58377374 Ben Widawsky 2022-02-11  633  {
786e9e58377374 Ben Widawsky 2022-02-11  634  	struct rootd_context ctx;
786e9e58377374 Ben Widawsky 2022-02-11  635  	struct device *ret;
786e9e58377374 Ben Widawsky 2022-02-11  636  =

a87877add7dded Ben Widawsky 2022-02-11  637  	ctx.cxlr =3D (struct cxl_regi=
on *)cxlr;
786e9e58377374 Ben Widawsky 2022-02-11  638  =

786e9e58377374 Ben Widawsky 2022-02-11  639  	ret =3D device_find_child((st=
ruct device *)&root->dev, &ctx, rootd_match);
786e9e58377374 Ben Widawsky 2022-02-11  640  	if (ret)
786e9e58377374 Ben Widawsky 2022-02-11  641  		return to_cxl_decoder(ret);
786e9e58377374 Ben Widawsky 2022-02-11  642  =

786e9e58377374 Ben Widawsky 2022-02-11  643  	return NULL;
786e9e58377374 Ben Widawsky 2022-02-11  644  }
786e9e58377374 Ben Widawsky 2022-02-11  645  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  646  static void cleanup_staged_dec=
oders(struct cxl_region *cxlr)
786e9e58377374 Ben Widawsky 2022-02-11  647  {
b15cb12c2369e0 Ben Widawsky 2022-02-11  648  	struct cxl_decoder *cxld, *d;
b15cb12c2369e0 Ben Widawsky 2022-02-11  649  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  650  	list_for_each_entry_safe(cxld=
, d, &cxlr->staged_list, region_link) {
b15cb12c2369e0 Ben Widawsky 2022-02-11  651  		cxl_put_decoder(cxld);
b15cb12c2369e0 Ben Widawsky 2022-02-11  652  		list_del_init(&cxld->region_=
link);
b15cb12c2369e0 Ben Widawsky 2022-02-11  653  	}
b15cb12c2369e0 Ben Widawsky 2022-02-11  654  }
b15cb12c2369e0 Ben Widawsky 2022-02-11  655  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  656  static int collect_ep_decoders=
(struct cxl_region *cxlr)
b15cb12c2369e0 Ben Widawsky 2022-02-11  657  {
b15cb12c2369e0 Ben Widawsky 2022-02-11  658  	struct cxl_memdev *ep;
b15cb12c2369e0 Ben Widawsky 2022-02-11  659  	int i, rc =3D 0;
b15cb12c2369e0 Ben Widawsky 2022-02-11  660  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  661  	for_each_cxl_endpoint(ep, cxl=
r, i) {
b15cb12c2369e0 Ben Widawsky 2022-02-11  662  		struct cxl_decoder *cxld;
b15cb12c2369e0 Ben Widawsky 2022-02-11  663  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  664  		cxld =3D get_decoder(cxlr, e=
p->port);
b15cb12c2369e0 Ben Widawsky 2022-02-11  665  		if (IS_ERR(cxld)) {
b15cb12c2369e0 Ben Widawsky 2022-02-11  666  			rc =3D PTR_ERR(cxld);
b15cb12c2369e0 Ben Widawsky 2022-02-11  667  			goto err;
b15cb12c2369e0 Ben Widawsky 2022-02-11  668  		}
b15cb12c2369e0 Ben Widawsky 2022-02-11  669  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  670  		cxld->interleave_granularity=
 =3D region_granularity(cxlr);
b15cb12c2369e0 Ben Widawsky 2022-02-11  671  		cxld->interleave_ways =3D re=
gion_ways(cxlr);
b15cb12c2369e0 Ben Widawsky 2022-02-11  672  	}
b15cb12c2369e0 Ben Widawsky 2022-02-11  673  =

786e9e58377374 Ben Widawsky 2022-02-11  674  	return 0;
b15cb12c2369e0 Ben Widawsky 2022-02-11  675  =

b15cb12c2369e0 Ben Widawsky 2022-02-11  676  err:
b15cb12c2369e0 Ben Widawsky 2022-02-11  677  	cleanup_staged_decoders(cxlr);
b15cb12c2369e0 Ben Widawsky 2022-02-11  678  	return rc;
786e9e58377374 Ben Widawsky 2022-02-11  679  }
786e9e58377374 Ben Widawsky 2022-02-11  680  =

968e6c3d87e25a Ben Widawsky 2022-02-11  681  static int bind_region(struct =
cxl_region *cxlr)
786e9e58377374 Ben Widawsky 2022-02-11  682  {
968e6c3d87e25a Ben Widawsky 2022-02-11  683  	struct cxl_decoder *cxld, *d;
968e6c3d87e25a Ben Widawsky 2022-02-11  684  	int rc;
968e6c3d87e25a Ben Widawsky 2022-02-11  685  =

968e6c3d87e25a Ben Widawsky 2022-02-11  686  	list_for_each_entry_safe(cxld=
, d, &cxlr->staged_list, region_link) {
968e6c3d87e25a Ben Widawsky 2022-02-11  687  		rc =3D cxl_commit_decoder(cx=
ld);
968e6c3d87e25a Ben Widawsky 2022-02-11  688  		if (!rc) {
968e6c3d87e25a Ben Widawsky 2022-02-11  689  			list_move_tail(&cxld->regio=
n_link, &cxlr->commit_list);
968e6c3d87e25a Ben Widawsky 2022-02-11  690  		} else {
968e6c3d87e25a Ben Widawsky 2022-02-11  691  			dev_dbg(&cxlr->dev, "Failed=
 to commit %s\n",
968e6c3d87e25a Ben Widawsky 2022-02-11  692  				dev_name(&cxld->dev));
968e6c3d87e25a Ben Widawsky 2022-02-11  693  			break;
968e6c3d87e25a Ben Widawsky 2022-02-11  694  		}
968e6c3d87e25a Ben Widawsky 2022-02-11  695  	}
968e6c3d87e25a Ben Widawsky 2022-02-11  696  =

968e6c3d87e25a Ben Widawsky 2022-02-11  697  	list_for_each_entry_safe(cxld=
, d, &cxlr->commit_list, region_link) {
968e6c3d87e25a Ben Widawsky 2022-02-11 @698  		if (rc) {
968e6c3d87e25a Ben Widawsky 2022-02-11  699  			cxl_disable_decoder(cxld);
968e6c3d87e25a Ben Widawsky 2022-02-11  700  			list_del(&cxld->region_link=
);
968e6c3d87e25a Ben Widawsky 2022-02-11  701  		}
968e6c3d87e25a Ben Widawsky 2022-02-11  702  	}
968e6c3d87e25a Ben Widawsky 2022-02-11  703  =

968e6c3d87e25a Ben Widawsky 2022-02-11  704  	if (rc)
968e6c3d87e25a Ben Widawsky 2022-02-11  705  		cleanup_staged_decoders(cxlr=
);
968e6c3d87e25a Ben Widawsky 2022-02-11  706  =

968e6c3d87e25a Ben Widawsky 2022-02-11  707  	BUG_ON(!list_empty(&cxlr->sta=
ged_list));
968e6c3d87e25a Ben Widawsky 2022-02-11  708  	return rc;
968e6c3d87e25a Ben Widawsky 2022-02-11  709  }
968e6c3d87e25a Ben Widawsky 2022-02-11  710  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2977275244666846776==--

