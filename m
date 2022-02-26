Content-Type: multipart/mixed; boundary="===============6469658335791243866=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 62/78] drivers/cxl/region.c:550:5-16: ERROR: invalid reference to the index variable of the iterator on line 543
Date: Sun, 27 Feb 2022 03:15:11 +0800
Message-ID: <202202270349.MikaZ9ZX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6469658335791243866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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
:::::: branch date: 25 hours ago
:::::: commit date: 9 days ago
config: alpha-randconfig-c004-20220227 (https://download.01.org/0day-ci/arc=
hive/20220227/202202270349.MikaZ9ZX-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/region.c:550:5-16: ERROR: invalid reference to the index var=
iable of the iterator on line 543

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
2ecd98fe1cb074 Ben Widawsky 2022-02-11 @543  				list_for_each_entry(switch=
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


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6469658335791243866==--

