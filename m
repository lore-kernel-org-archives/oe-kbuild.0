Content-Type: multipart/mixed; boundary="===============1967178630473931870=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 15/18] drivers/cxl/region.c:550:5-16: ERROR: invalid reference to the index variable of the iterator on line 543
Date: Tue, 01 Feb 2022 14:50:58 +0800
Message-ID: <202202011459.DxsFvczl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1967178630473931870==
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   639e187dc9ae68fe9f0abe899e0e9ad2a3eab638
commit: afeb4e8bc55452dd71049e38b44671e5e297f39c [15/18] cxl/region: Add su=
pport for single switch level
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c002-20220131 (https://download.01.org/0day-ci/ar=
chive/20220201/202202011459.DxsFvczl-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/region.c:550:5-16: ERROR: invalid reference to the index var=
iable of the iterator on line 543

vim +550 drivers/cxl/region.c

2eb1e5a7b1d77a Ben Widawsky 2021-12-18  413  =

1af38ef70b9a72 Ben Widawsky 2021-06-15  414  /**
1af38ef70b9a72 Ben Widawsky 2021-06-15  415   * region_hb_rp_config_valid()=
 - determine root port ordering is correct
1af38ef70b9a72 Ben Widawsky 2021-06-15  416   * @cxlr: Region to validate
1af38ef70b9a72 Ben Widawsky 2021-06-15  417   * @rootd: root decoder for th=
is @cxlr
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  418   * @state_update: Whether or n=
ot to update port state
1af38ef70b9a72 Ben Widawsky 2021-06-15  419   *
1af38ef70b9a72 Ben Widawsky 2021-06-15  420   * The algorithm is outlined i=
n 2.13.15 "Verify HB root port configuration
1af38ef70b9a72 Ben Widawsky 2021-06-15  421   * sequence" of the CXL Memory=
 Device SW Guide (Rev1p0).
1af38ef70b9a72 Ben Widawsky 2021-06-15  422   *
1af38ef70b9a72 Ben Widawsky 2021-06-15  423   * Returns true if the configu=
ration is valid.
1af38ef70b9a72 Ben Widawsky 2021-06-15  424   */
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  425  static bool region_hb_rp_confi=
g_valid(struct cxl_region *cxlr,
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  426  				      const struct cxl_dec=
oder *rootd,
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  427  				      bool state_update)
1af38ef70b9a72 Ben Widawsky 2021-06-15  428  {
afeb4e8bc55452 Ben Widawsky 2022-01-13  429  	const int region_ig =3D cxl_t=
o_ig(cxlr->config.interleave_granularity);
afeb4e8bc55452 Ben Widawsky 2022-01-13  430  	const int region_eniw =3D cxl=
_to_eniw(cxlr->config.interleave_ways);
82944362763abe Ben Widawsky 2021-10-08  431  	const int num_root_ports =3D =
get_num_root_ports(cxlr);
82944362763abe Ben Widawsky 2021-10-08  432  	struct cxl_port *hbs[CXL_DECO=
DER_MAX_INTERLEAVE];
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  433  	struct cxl_decoder *cxld, *c;
82944362763abe Ben Widawsky 2021-10-08  434  	int hb_count, i;
82944362763abe Ben Widawsky 2021-10-08  435  =

82944362763abe Ben Widawsky 2021-10-08  436  	hb_count =3D get_unique_hostb=
ridges(cxlr, hbs);
82944362763abe Ben Widawsky 2021-10-08  437  =

afeb4e8bc55452 Ben Widawsky 2022-01-13  438  	/* TODO: support multiple lev=
els of switches */
afeb4e8bc55452 Ben Widawsky 2022-01-13  439  	if (has_multi_switch(cxlr))
afeb4e8bc55452 Ben Widawsky 2022-01-13  440  		return false;
afeb4e8bc55452 Ben Widawsky 2022-01-13  441  =

afeb4e8bc55452 Ben Widawsky 2022-01-13  442  	/* TODO: x3 interleave for sw=
itches is hard. */
afeb4e8bc55452 Ben Widawsky 2022-01-13  443  	if (has_switch(cxlr) && !is_p=
ower_of_2(region_ways(cxlr)))
82944362763abe Ben Widawsky 2021-10-08  444  		return false;
82944362763abe Ben Widawsky 2021-10-08  445  =

82944362763abe Ben Widawsky 2021-10-08  446  	/*
82944362763abe Ben Widawsky 2021-10-08  447  	 * Are all devices in this re=
gion on the same CXL Host Bridge
82944362763abe Ben Widawsky 2021-10-08  448  	 * Root Port?
82944362763abe Ben Widawsky 2021-10-08  449  	 */
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  450  	if (num_root_ports =3D=3D 1 &=
& !has_switch(cxlr) && state_update)
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  451  		return simple_config(cxlr, h=
bs[0]);
82944362763abe Ben Widawsky 2021-10-08  452  =

82944362763abe Ben Widawsky 2021-10-08  453  	for (i =3D 0; i < hb_count; i=
++) {
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  454  		struct cxl_decoder *cxld;
82944362763abe Ben Widawsky 2021-10-08  455  		int idx, position_mask;
82944362763abe Ben Widawsky 2021-10-08  456  		struct cxl_dport *rp;
82944362763abe Ben Widawsky 2021-10-08  457  		struct cxl_port *hb;
82944362763abe Ben Widawsky 2021-10-08  458  =

82944362763abe Ben Widawsky 2021-10-08  459  		/* Get next CXL Host Bridge =
this region spans */
82944362763abe Ben Widawsky 2021-10-08  460  		hb =3D hbs[i];
82944362763abe Ben Widawsky 2021-10-08  461  =

2eb1e5a7b1d77a Ben Widawsky 2021-12-18  462  		if (state_update) {
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  463  			cxld =3D get_decoder(cxlr, =
hb);
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  464  			if (IS_ERR(cxld)) {
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  465  				dev_dbg(&cxlr->dev,
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  466  					"Couldn't get decoder for=
 %s\n",
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  467  					dev_name(&hb->dev));
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  468  				goto err;
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  469  			}
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  470  			cxld->interleave_ways =3D 0;
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  471  			cxld->interleave_granularit=
y =3D region_granularity(cxlr);
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  472  		} else {
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  473  			cxld =3D NULL;
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  474  		}
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  475  =

82944362763abe Ben Widawsky 2021-10-08  476  		/*
82944362763abe Ben Widawsky 2021-10-08  477  		 * Calculate the position ma=
sk: NumRootPorts =3D 2^PositionMask
82944362763abe Ben Widawsky 2021-10-08  478  		 * for this region.
82944362763abe Ben Widawsky 2021-10-08  479  		 *
82944362763abe Ben Widawsky 2021-10-08  480  		 * XXX: pos_mask is actually=
 (1 << PositionMask)  - 1
82944362763abe Ben Widawsky 2021-10-08  481  		 */
82944362763abe Ben Widawsky 2021-10-08  482  		position_mask =3D (1 << (ilo=
g2(num_root_ports))) - 1;
82944362763abe Ben Widawsky 2021-10-08  483  =

82944362763abe Ben Widawsky 2021-10-08  484  		/*
82944362763abe Ben Widawsky 2021-10-08  485  		 * Calculate the PortGroupin=
g for each device on this CXL Host
82944362763abe Ben Widawsky 2021-10-08  486  		 * Bridge Root Port:
82944362763abe Ben Widawsky 2021-10-08  487  		 * PortGrouping =3D RegionLa=
bel.Position & PositionMask
82944362763abe Ben Widawsky 2021-10-08  488  		 *
82944362763abe Ben Widawsky 2021-10-08  489  		 * The following nest iterat=
ors effectively iterate over each
82944362763abe Ben Widawsky 2021-10-08  490  		 * root port in the region.
82944362763abe Ben Widawsky 2021-10-08  491  		 *   for_each_unique_rootpor=
t(rp, cxlr)
82944362763abe Ben Widawsky 2021-10-08  492  		 */
82944362763abe Ben Widawsky 2021-10-08  493  		list_for_each_entry(rp, &hb-=
>dports, list) {
82944362763abe Ben Widawsky 2021-10-08  494  			struct cxl_memdev *ep;
82944362763abe Ben Widawsky 2021-10-08  495  			int port_grouping =3D -1;
afeb4e8bc55452 Ben Widawsky 2022-01-13  496  			int target_ndx;
82944362763abe Ben Widawsky 2021-10-08  497  =

82944362763abe Ben Widawsky 2021-10-08  498  			for_each_cxl_endpoint_hb(ep=
, cxlr, hb, idx) {
afeb4e8bc55452 Ben Widawsky 2022-01-13  499  				struct cxl_decoder *switch=
_cxld;
afeb4e8bc55452 Ben Widawsky 2022-01-13  500  				struct cxl_dport *target;
afeb4e8bc55452 Ben Widawsky 2022-01-13  501  				struct cxl_port *switch_po=
rt;
afeb4e8bc55452 Ben Widawsky 2022-01-13  502  				bool found =3D false;
afeb4e8bc55452 Ben Widawsky 2022-01-13  503  =

82944362763abe Ben Widawsky 2021-10-08  504  				if (get_rp(ep) !=3D rp)
82944362763abe Ben Widawsky 2021-10-08  505  					continue;
82944362763abe Ben Widawsky 2021-10-08  506  =

82944362763abe Ben Widawsky 2021-10-08  507  				if (port_grouping =3D=3D -=
1)
82944362763abe Ben Widawsky 2021-10-08  508  					port_grouping =3D idx & p=
osition_mask;
82944362763abe Ben Widawsky 2021-10-08  509  =

82944362763abe Ben Widawsky 2021-10-08  510  				/*
82944362763abe Ben Widawsky 2021-10-08  511  				 * Do all devices in the r=
egion connected to this CXL
82944362763abe Ben Widawsky 2021-10-08  512  				 * Host Bridge Root Port h=
ave the same PortGrouping?
82944362763abe Ben Widawsky 2021-10-08  513  				 */
82944362763abe Ben Widawsky 2021-10-08  514  				if ((idx & position_mask) =
!=3D port_grouping) {
82944362763abe Ben Widawsky 2021-10-08  515  					dev_dbg(&cxlr->dev,
82944362763abe Ben Widawsky 2021-10-08  516  						"One or more devices are=
 not connected to the correct Host Bridge Root Port\n");
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  517  					goto err;
82944362763abe Ben Widawsky 2021-10-08  518  				}
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  519  =

b6ba8e7a4176c7 Ben Widawsky 2021-10-14  520  				if (!state_update)
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  521  					continue;
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  522  =

b6ba8e7a4176c7 Ben Widawsky 2021-10-14  523  				if (dev_WARN_ONCE(&cxld->d=
ev,
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  524  						  port_grouping >=3D cxl=
d->nr_targets,
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  525  						  "Invalid port grouping=
 %d/%d\n",
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  526  						  port_grouping, cxld->n=
r_targets))
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  527  					goto err;
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  528  =

b6ba8e7a4176c7 Ben Widawsky 2021-10-14  529  				cxld->interleave_ways++;
b6ba8e7a4176c7 Ben Widawsky 2021-10-14  530  				cxld->target[port_grouping=
] =3D get_rp(ep);
afeb4e8bc55452 Ben Widawsky 2022-01-13  531  =

afeb4e8bc55452 Ben Widawsky 2022-01-13  532  				/*
afeb4e8bc55452 Ben Widawsky 2022-01-13  533  				 * At least one switch is =
connected here if the endpoint
afeb4e8bc55452 Ben Widawsky 2022-01-13  534  				 * has a depth > 2
afeb4e8bc55452 Ben Widawsky 2022-01-13  535  				 */
afeb4e8bc55452 Ben Widawsky 2022-01-13  536  				if (ep->port->depth =3D=3D=
 2)
afeb4e8bc55452 Ben Widawsky 2022-01-13  537  					continue;
afeb4e8bc55452 Ben Widawsky 2022-01-13  538  =

afeb4e8bc55452 Ben Widawsky 2022-01-13  539  				/* Check the staged list t=
o see if this
afeb4e8bc55452 Ben Widawsky 2022-01-13  540  				 * port has already been a=
dded
afeb4e8bc55452 Ben Widawsky 2022-01-13  541  				 */
afeb4e8bc55452 Ben Widawsky 2022-01-13  542  				switch_port =3D get_switch=
(ep);
afeb4e8bc55452 Ben Widawsky 2022-01-13 @543  				list_for_each_entry(switch=
_cxld, &cxlr->staged_list, region_link) {
afeb4e8bc55452 Ben Widawsky 2022-01-13  544  					if (to_cxl_port(switch_cx=
ld->dev.parent) =3D=3D switch_port)
afeb4e8bc55452 Ben Widawsky 2022-01-13  545  						found =3D true;
afeb4e8bc55452 Ben Widawsky 2022-01-13  546  				}
afeb4e8bc55452 Ben Widawsky 2022-01-13  547  =

afeb4e8bc55452 Ben Widawsky 2022-01-13  548  				if (found) {
afeb4e8bc55452 Ben Widawsky 2022-01-13  549  					target =3D cxl_find_dport=
_by_dev(switch_port, ep->dev.parent->parent);
afeb4e8bc55452 Ben Widawsky 2022-01-13 @550  					switch_cxld->target[targe=
t_ndx++] =3D target;
afeb4e8bc55452 Ben Widawsky 2022-01-13  551  					continue;
afeb4e8bc55452 Ben Widawsky 2022-01-13  552  				}
afeb4e8bc55452 Ben Widawsky 2022-01-13  553  =

afeb4e8bc55452 Ben Widawsky 2022-01-13  554  				target_ndx =3D 0;
afeb4e8bc55452 Ben Widawsky 2022-01-13  555  =

afeb4e8bc55452 Ben Widawsky 2022-01-13  556  				switch_cxld =3D get_decode=
r(cxlr, switch_port);
afeb4e8bc55452 Ben Widawsky 2022-01-13  557  				switch_cxld->interleave_wa=
ys++;
afeb4e8bc55452 Ben Widawsky 2022-01-13  558  				switch_cxld->interleave_gr=
anularity =3D cxl_to_ways(region_ig + region_eniw);
82944362763abe Ben Widawsky 2021-10-08  559  			}
82944362763abe Ben Widawsky 2021-10-08  560  		}
82944362763abe Ben Widawsky 2021-10-08  561  	}
82944362763abe Ben Widawsky 2021-10-08  562  =

1af38ef70b9a72 Ben Widawsky 2021-06-15  563  	return true;
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  564  =

2eb1e5a7b1d77a Ben Widawsky 2021-12-18  565  err:
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  566  	dev_dbg(&cxlr->dev, "Couldn't=
 get decoder for region\n");
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  567  	list_for_each_entry_safe(cxld=
, c, &cxlr->staged_list, region_link)
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  568  		cxl_put_decoder(cxld);
2eb1e5a7b1d77a Ben Widawsky 2021-12-18  569  =

2eb1e5a7b1d77a Ben Widawsky 2021-12-18  570  	return false;
1af38ef70b9a72 Ben Widawsky 2021-06-15  571  }
1af38ef70b9a72 Ben Widawsky 2021-06-15  572  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1967178630473931870==--

