Content-Type: multipart/mixed; boundary="===============0459363705067698541=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 57/60] drivers/cxl/region.c:533:5-16: ERROR: invalid reference to the index variable of the iterator on line 526
Date: Thu, 27 Jan 2022 17:44:12 +0800
Message-ID: <202201271618.bXoQSwDG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0459363705067698541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   41c2d219a2c8e14de644f4e953e0c57402c3e884
commit: a8759d81b528e3e5c4989e9f86d56a09faf39364 [57/60] cxl/region: Add su=
pport for single switch level
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: powerpc-randconfig-c004-20220124 (https://download.01.org/0day-ci/a=
rchive/20220127/202201271618.bXoQSwDG-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/region.c:533:5-16: ERROR: invalid reference to the index var=
iable of the iterator on line 526

vim +533 drivers/cxl/region.c

e7e84f7fccbb09 Ben Widawsky 2021-12-18  396  =

84dbaed92240cd Ben Widawsky 2021-06-15  397  /**
84dbaed92240cd Ben Widawsky 2021-06-15  398   * region_hb_rp_config_valid()=
 - determine root port ordering is correct
84dbaed92240cd Ben Widawsky 2021-06-15  399   * @cxlr: Region to validate
84dbaed92240cd Ben Widawsky 2021-06-15  400   * @rootd: root decoder for th=
is @cxlr
e7e84f7fccbb09 Ben Widawsky 2021-12-18  401   * @state_update: Whether or n=
ot to update port state
84dbaed92240cd Ben Widawsky 2021-06-15  402   *
84dbaed92240cd Ben Widawsky 2021-06-15  403   * The algorithm is outlined i=
n 2.13.15 "Verify HB root port configuration
84dbaed92240cd Ben Widawsky 2021-06-15  404   * sequence" of the CXL Memory=
 Device SW Guide (Rev1p0).
84dbaed92240cd Ben Widawsky 2021-06-15  405   *
84dbaed92240cd Ben Widawsky 2021-06-15  406   * Returns true if the configu=
ration is valid.
84dbaed92240cd Ben Widawsky 2021-06-15  407   */
e7e84f7fccbb09 Ben Widawsky 2021-12-18  408  static bool region_hb_rp_confi=
g_valid(struct cxl_region *cxlr,
e7e84f7fccbb09 Ben Widawsky 2021-12-18  409  				      const struct cxl_dec=
oder *rootd,
e7e84f7fccbb09 Ben Widawsky 2021-12-18  410  				      bool state_update)
84dbaed92240cd Ben Widawsky 2021-06-15  411  {
a8759d81b528e3 Ben Widawsky 2022-01-13  412  	const int region_ig =3D cxl_t=
o_ig(cxlr->config.interleave_granularity);
a8759d81b528e3 Ben Widawsky 2022-01-13  413  	const int region_eniw =3D cxl=
_to_eniw(cxlr->config.interleave_ways);
e6b7dbd076fea0 Ben Widawsky 2021-10-08  414  	const int num_root_ports =3D =
get_num_root_ports(cxlr);
e6b7dbd076fea0 Ben Widawsky 2021-10-08  415  	struct cxl_port *hbs[CXL_DECO=
DER_MAX_INTERLEAVE];
e7e84f7fccbb09 Ben Widawsky 2021-12-18  416  	struct cxl_decoder *cxld, *c;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  417  	int hb_count, i;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  418  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  419  	hb_count =3D get_unique_hostb=
ridges(cxlr, hbs);
e6b7dbd076fea0 Ben Widawsky 2021-10-08  420  =

a8759d81b528e3 Ben Widawsky 2022-01-13  421  	/* TODO: support multiple lev=
els of switches */
a8759d81b528e3 Ben Widawsky 2022-01-13  422  	if (has_multi_switch(cxlr))
a8759d81b528e3 Ben Widawsky 2022-01-13  423  		return false;
a8759d81b528e3 Ben Widawsky 2022-01-13  424  =

a8759d81b528e3 Ben Widawsky 2022-01-13  425  	/* TODO: x3 interleave for sw=
itches is hard. */
a8759d81b528e3 Ben Widawsky 2022-01-13  426  	if (has_switch(cxlr) && !is_p=
ower_of_2(region_ways(cxlr)))
e6b7dbd076fea0 Ben Widawsky 2021-10-08  427  		return false;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  428  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  429  	/*
e6b7dbd076fea0 Ben Widawsky 2021-10-08  430  	 * Are all devices in this re=
gion on the same CXL Host Bridge
e6b7dbd076fea0 Ben Widawsky 2021-10-08  431  	 * Root Port?
e6b7dbd076fea0 Ben Widawsky 2021-10-08  432  	 */
e7e84f7fccbb09 Ben Widawsky 2021-12-18  433  	if (num_root_ports =3D=3D 1 &=
& !has_switch(cxlr) && state_update)
e7e84f7fccbb09 Ben Widawsky 2021-12-18  434  		return simple_config(cxlr, h=
bs[0]);
e6b7dbd076fea0 Ben Widawsky 2021-10-08  435  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  436  	for (i =3D 0; i < hb_count; i=
++) {
4826d3a341cdac Ben Widawsky 2021-10-14  437  		struct cxl_decoder *cxld;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  438  		int idx, position_mask;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  439  		struct cxl_dport *rp;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  440  		struct cxl_port *hb;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  441  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  442  		/* Get next CXL Host Bridge =
this region spans */
e6b7dbd076fea0 Ben Widawsky 2021-10-08  443  		hb =3D hbs[i];
e6b7dbd076fea0 Ben Widawsky 2021-10-08  444  =

e7e84f7fccbb09 Ben Widawsky 2021-12-18  445  		if (state_update) {
e7e84f7fccbb09 Ben Widawsky 2021-12-18  446  			cxld =3D get_decoder(cxlr, =
hb);
e7e84f7fccbb09 Ben Widawsky 2021-12-18  447  			if (IS_ERR(cxld)) {
e7e84f7fccbb09 Ben Widawsky 2021-12-18  448  				dev_dbg(&cxlr->dev,
e7e84f7fccbb09 Ben Widawsky 2021-12-18  449  					"Couldn't get decoder for=
 %s\n",
e7e84f7fccbb09 Ben Widawsky 2021-12-18  450  					dev_name(&hb->dev));
e7e84f7fccbb09 Ben Widawsky 2021-12-18  451  				goto err;
e7e84f7fccbb09 Ben Widawsky 2021-12-18  452  			}
e7e84f7fccbb09 Ben Widawsky 2021-12-18  453  			cxld->interleave_ways =3D 0;
e7e84f7fccbb09 Ben Widawsky 2021-12-18  454  			cxld->interleave_granularit=
y =3D region_granularity(cxlr);
e7e84f7fccbb09 Ben Widawsky 2021-12-18  455  		} else {
e7e84f7fccbb09 Ben Widawsky 2021-12-18  456  			cxld =3D NULL;
e7e84f7fccbb09 Ben Widawsky 2021-12-18  457  		}
e7e84f7fccbb09 Ben Widawsky 2021-12-18  458  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  459  		/*
e6b7dbd076fea0 Ben Widawsky 2021-10-08  460  		 * Calculate the position ma=
sk: NumRootPorts =3D 2^PositionMask
e6b7dbd076fea0 Ben Widawsky 2021-10-08  461  		 * for this region.
e6b7dbd076fea0 Ben Widawsky 2021-10-08  462  		 *
e6b7dbd076fea0 Ben Widawsky 2021-10-08  463  		 * XXX: pos_mask is actually=
 (1 << PositionMask)  - 1
e6b7dbd076fea0 Ben Widawsky 2021-10-08  464  		 */
e6b7dbd076fea0 Ben Widawsky 2021-10-08  465  		position_mask =3D (1 << (ilo=
g2(num_root_ports))) - 1;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  466  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  467  		/*
e6b7dbd076fea0 Ben Widawsky 2021-10-08  468  		 * Calculate the PortGroupin=
g for each device on this CXL Host
e6b7dbd076fea0 Ben Widawsky 2021-10-08  469  		 * Bridge Root Port:
e6b7dbd076fea0 Ben Widawsky 2021-10-08  470  		 * PortGrouping =3D RegionLa=
bel.Position & PositionMask
e6b7dbd076fea0 Ben Widawsky 2021-10-08  471  		 *
e6b7dbd076fea0 Ben Widawsky 2021-10-08  472  		 * The following nest iterat=
ors effectively iterate over each
e6b7dbd076fea0 Ben Widawsky 2021-10-08  473  		 * root port in the region.
e6b7dbd076fea0 Ben Widawsky 2021-10-08  474  		 *   for_each_unique_rootpor=
t(rp, cxlr)
e6b7dbd076fea0 Ben Widawsky 2021-10-08  475  		 */
e6b7dbd076fea0 Ben Widawsky 2021-10-08  476  		list_for_each_entry(rp, &hb-=
>dports, list) {
e6b7dbd076fea0 Ben Widawsky 2021-10-08  477  			struct cxl_memdev *ep;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  478  			int port_grouping =3D -1;
a8759d81b528e3 Ben Widawsky 2022-01-13  479  			int target_ndx;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  480  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  481  			for_each_cxl_endpoint_hb(ep=
, cxlr, hb, idx) {
a8759d81b528e3 Ben Widawsky 2022-01-13  482  				struct cxl_decoder *switch=
_cxld;
a8759d81b528e3 Ben Widawsky 2022-01-13  483  				struct cxl_dport *target;
a8759d81b528e3 Ben Widawsky 2022-01-13  484  				struct cxl_port *switch_po=
rt;
a8759d81b528e3 Ben Widawsky 2022-01-13  485  				bool found =3D false;
a8759d81b528e3 Ben Widawsky 2022-01-13  486  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  487  				if (get_rp(ep) !=3D rp)
e6b7dbd076fea0 Ben Widawsky 2021-10-08  488  					continue;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  489  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  490  				if (port_grouping =3D=3D -=
1)
e6b7dbd076fea0 Ben Widawsky 2021-10-08  491  					port_grouping =3D idx & p=
osition_mask;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  492  =

e6b7dbd076fea0 Ben Widawsky 2021-10-08  493  				/*
e6b7dbd076fea0 Ben Widawsky 2021-10-08  494  				 * Do all devices in the r=
egion connected to this CXL
e6b7dbd076fea0 Ben Widawsky 2021-10-08  495  				 * Host Bridge Root Port h=
ave the same PortGrouping?
e6b7dbd076fea0 Ben Widawsky 2021-10-08  496  				 */
e6b7dbd076fea0 Ben Widawsky 2021-10-08  497  				if ((idx & position_mask) =
!=3D port_grouping) {
e6b7dbd076fea0 Ben Widawsky 2021-10-08  498  					dev_dbg(&cxlr->dev,
e6b7dbd076fea0 Ben Widawsky 2021-10-08  499  						"One or more devices are=
 not connected to the correct Host Bridge Root Port\n");
e7e84f7fccbb09 Ben Widawsky 2021-12-18  500  					goto err;
e6b7dbd076fea0 Ben Widawsky 2021-10-08  501  				}
4826d3a341cdac Ben Widawsky 2021-10-14  502  =

4826d3a341cdac Ben Widawsky 2021-10-14  503  				if (!state_update)
4826d3a341cdac Ben Widawsky 2021-10-14  504  					continue;
4826d3a341cdac Ben Widawsky 2021-10-14  505  =

4826d3a341cdac Ben Widawsky 2021-10-14  506  				if (dev_WARN_ONCE(&cxld->d=
ev,
4826d3a341cdac Ben Widawsky 2021-10-14  507  						  port_grouping >=3D cxl=
d->nr_targets,
4826d3a341cdac Ben Widawsky 2021-10-14  508  						  "Invalid port grouping=
 %d/%d\n",
4826d3a341cdac Ben Widawsky 2021-10-14  509  						  port_grouping, cxld->n=
r_targets))
4826d3a341cdac Ben Widawsky 2021-10-14  510  					goto err;
4826d3a341cdac Ben Widawsky 2021-10-14  511  =

4826d3a341cdac Ben Widawsky 2021-10-14  512  				cxld->interleave_ways++;
4826d3a341cdac Ben Widawsky 2021-10-14  513  				cxld->target[port_grouping=
] =3D get_rp(ep);
a8759d81b528e3 Ben Widawsky 2022-01-13  514  =

a8759d81b528e3 Ben Widawsky 2022-01-13  515  				/*
a8759d81b528e3 Ben Widawsky 2022-01-13  516  				 * At least one switch is =
connected here if the endpoint
a8759d81b528e3 Ben Widawsky 2022-01-13  517  				 * has a depth > 2
a8759d81b528e3 Ben Widawsky 2022-01-13  518  				 */
a8759d81b528e3 Ben Widawsky 2022-01-13  519  				if (ep->port->depth =3D=3D=
 2)
a8759d81b528e3 Ben Widawsky 2022-01-13  520  					continue;
a8759d81b528e3 Ben Widawsky 2022-01-13  521  =

a8759d81b528e3 Ben Widawsky 2022-01-13  522  				/* Check the staged list t=
o see if this
a8759d81b528e3 Ben Widawsky 2022-01-13  523  				 * port has already been a=
dded
a8759d81b528e3 Ben Widawsky 2022-01-13  524  				 */
a8759d81b528e3 Ben Widawsky 2022-01-13  525  				switch_port =3D get_switch=
(ep);
a8759d81b528e3 Ben Widawsky 2022-01-13 @526  				list_for_each_entry(switch=
_cxld, &cxlr->staged_list, region_link) {
a8759d81b528e3 Ben Widawsky 2022-01-13  527  					if (to_cxl_port(switch_cx=
ld->dev.parent) =3D=3D switch_port)
a8759d81b528e3 Ben Widawsky 2022-01-13  528  						found =3D true;
a8759d81b528e3 Ben Widawsky 2022-01-13  529  				}
a8759d81b528e3 Ben Widawsky 2022-01-13  530  =

a8759d81b528e3 Ben Widawsky 2022-01-13  531  				if (found) {
a8759d81b528e3 Ben Widawsky 2022-01-13  532  					target =3D cxl_find_dport=
_by_dev(switch_port, ep->dev.parent->parent);
a8759d81b528e3 Ben Widawsky 2022-01-13 @533  					switch_cxld->target[targe=
t_ndx++] =3D target;
a8759d81b528e3 Ben Widawsky 2022-01-13  534  					continue;
a8759d81b528e3 Ben Widawsky 2022-01-13  535  				}
a8759d81b528e3 Ben Widawsky 2022-01-13  536  =

a8759d81b528e3 Ben Widawsky 2022-01-13  537  				target_ndx =3D 0;
a8759d81b528e3 Ben Widawsky 2022-01-13  538  =

a8759d81b528e3 Ben Widawsky 2022-01-13  539  				switch_cxld =3D get_decode=
r(cxlr, switch_port);
a8759d81b528e3 Ben Widawsky 2022-01-13  540  				switch_cxld->interleave_wa=
ys++;
a8759d81b528e3 Ben Widawsky 2022-01-13  541  				switch_cxld->interleave_gr=
anularity =3D cxl_to_ways(region_ig + region_eniw);
e6b7dbd076fea0 Ben Widawsky 2021-10-08  542  			}
e6b7dbd076fea0 Ben Widawsky 2021-10-08  543  		}
e6b7dbd076fea0 Ben Widawsky 2021-10-08  544  	}
e6b7dbd076fea0 Ben Widawsky 2021-10-08  545  =

84dbaed92240cd Ben Widawsky 2021-06-15  546  	return true;
e7e84f7fccbb09 Ben Widawsky 2021-12-18  547  =

e7e84f7fccbb09 Ben Widawsky 2021-12-18  548  err:
e7e84f7fccbb09 Ben Widawsky 2021-12-18  549  	dev_dbg(&cxlr->dev, "Couldn't=
 get decoder for region\n");
e7e84f7fccbb09 Ben Widawsky 2021-12-18  550  	list_for_each_entry_safe(cxld=
, c, &cxlr->staged_list, region_link)
e7e84f7fccbb09 Ben Widawsky 2021-12-18  551  		cxl_put_decoder(cxld);
e7e84f7fccbb09 Ben Widawsky 2021-12-18  552  =

e7e84f7fccbb09 Ben Widawsky 2021-12-18  553  	return false;
84dbaed92240cd Ben Widawsky 2021-06-15  554  }
84dbaed92240cd Ben Widawsky 2021-06-15  555  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0459363705067698541==--

