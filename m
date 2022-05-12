Content-Type: multipart/mixed; boundary="===============3070457564251934628=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 63/67] drivers/cxl/region.c:550:5-16: ERROR: invalid reference to the index variable of the iterator on line 543
Date: Thu, 12 May 2022 20:44:07 +0800
Message-ID: <202205122051.9Etv0JJR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3070457564251934628==
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
head:   9c642abd8b31d895f34186bd72b7360083b58492
commit: 50b9ca060c8e4827a3871b94d983040eac80fac8 [63/67] cxl/region: Add su=
pport for single switch level
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-randconfig-c002-20220509 (https://download.01.org/0day-ci/ar=
chive/20220512/202205122051.9Etv0JJR-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/region.c:550:5-16: ERROR: invalid reference to the index var=
iable of the iterator on line 543

vim +550 drivers/cxl/region.c

5c4ecc7471fee0 Ben Widawsky 2022-02-11  413  =

e3a336d0e7c1ec Ben Widawsky 2022-02-11  414  /**
e3a336d0e7c1ec Ben Widawsky 2022-02-11  415   * region_hb_rp_config_valid()=
 - determine root port ordering is correct
e3a336d0e7c1ec Ben Widawsky 2022-02-11  416   * @cxlr: Region to validate
e3a336d0e7c1ec Ben Widawsky 2022-02-11  417   * @rootd: root decoder for th=
is @cxlr
5c4ecc7471fee0 Ben Widawsky 2022-02-11  418   * @state_update: Whether or n=
ot to update port state
e3a336d0e7c1ec Ben Widawsky 2022-02-11  419   *
e3a336d0e7c1ec Ben Widawsky 2022-02-11  420   * The algorithm is outlined i=
n 2.13.15 "Verify HB root port configuration
e3a336d0e7c1ec Ben Widawsky 2022-02-11  421   * sequence" of the CXL Memory=
 Device SW Guide (Rev1p0).
e3a336d0e7c1ec Ben Widawsky 2022-02-11  422   *
e3a336d0e7c1ec Ben Widawsky 2022-02-11  423   * Returns true if the configu=
ration is valid.
e3a336d0e7c1ec Ben Widawsky 2022-02-11  424   */
5c4ecc7471fee0 Ben Widawsky 2022-02-11  425  static bool region_hb_rp_confi=
g_valid(struct cxl_region *cxlr,
5c4ecc7471fee0 Ben Widawsky 2022-02-11  426  				      const struct cxl_dec=
oder *rootd,
5c4ecc7471fee0 Ben Widawsky 2022-02-11  427  				      bool state_update)
e3a336d0e7c1ec Ben Widawsky 2022-02-11  428  {
50b9ca060c8e48 Ben Widawsky 2022-02-11  429  	const int region_ig =3D cxl_t=
o_ig(cxlr->config.interleave_granularity);
50b9ca060c8e48 Ben Widawsky 2022-02-11  430  	const int region_eniw =3D cxl=
_to_eniw(cxlr->config.interleave_ways);
00b0519c6f9af5 Ben Widawsky 2022-02-11  431  	const int num_root_ports =3D =
get_num_root_ports(cxlr);
00b0519c6f9af5 Ben Widawsky 2022-02-11  432  	struct cxl_port *hbs[CXL_DECO=
DER_MAX_INTERLEAVE];
5c4ecc7471fee0 Ben Widawsky 2022-02-11  433  	struct cxl_decoder *cxld, *c;
00b0519c6f9af5 Ben Widawsky 2022-02-11  434  	int hb_count, i;
00b0519c6f9af5 Ben Widawsky 2022-02-11  435  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  436  	hb_count =3D get_unique_hostb=
ridges(cxlr, hbs);
00b0519c6f9af5 Ben Widawsky 2022-02-11  437  =

50b9ca060c8e48 Ben Widawsky 2022-02-11  438  	/* TODO: support multiple lev=
els of switches */
50b9ca060c8e48 Ben Widawsky 2022-02-11  439  	if (has_multi_switch(cxlr))
50b9ca060c8e48 Ben Widawsky 2022-02-11  440  		return false;
50b9ca060c8e48 Ben Widawsky 2022-02-11  441  =

50b9ca060c8e48 Ben Widawsky 2022-02-11  442  	/* TODO: x3 interleave for sw=
itches is hard. */
50b9ca060c8e48 Ben Widawsky 2022-02-11  443  	if (has_switch(cxlr) && !is_p=
ower_of_2(region_ways(cxlr)))
00b0519c6f9af5 Ben Widawsky 2022-02-11  444  		return false;
00b0519c6f9af5 Ben Widawsky 2022-02-11  445  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  446  	/*
00b0519c6f9af5 Ben Widawsky 2022-02-11  447  	 * Are all devices in this re=
gion on the same CXL Host Bridge
00b0519c6f9af5 Ben Widawsky 2022-02-11  448  	 * Root Port?
00b0519c6f9af5 Ben Widawsky 2022-02-11  449  	 */
5c4ecc7471fee0 Ben Widawsky 2022-02-11  450  	if (num_root_ports =3D=3D 1 &=
& !has_switch(cxlr) && state_update)
5c4ecc7471fee0 Ben Widawsky 2022-02-11  451  		return simple_config(cxlr, h=
bs[0]);
00b0519c6f9af5 Ben Widawsky 2022-02-11  452  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  453  	for (i =3D 0; i < hb_count; i=
++) {
0184ca5ccb0827 Ben Widawsky 2022-02-11  454  		struct cxl_decoder *cxld;
00b0519c6f9af5 Ben Widawsky 2022-02-11  455  		int idx, position_mask;
00b0519c6f9af5 Ben Widawsky 2022-02-11  456  		struct cxl_dport *rp;
00b0519c6f9af5 Ben Widawsky 2022-02-11  457  		struct cxl_port *hb;
00b0519c6f9af5 Ben Widawsky 2022-02-11  458  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  459  		/* Get next CXL Host Bridge =
this region spans */
00b0519c6f9af5 Ben Widawsky 2022-02-11  460  		hb =3D hbs[i];
00b0519c6f9af5 Ben Widawsky 2022-02-11  461  =

5c4ecc7471fee0 Ben Widawsky 2022-02-11  462  		if (state_update) {
5c4ecc7471fee0 Ben Widawsky 2022-02-11  463  			cxld =3D get_decoder(cxlr, =
hb);
5c4ecc7471fee0 Ben Widawsky 2022-02-11  464  			if (IS_ERR(cxld)) {
5c4ecc7471fee0 Ben Widawsky 2022-02-11  465  				dev_dbg(&cxlr->dev,
5c4ecc7471fee0 Ben Widawsky 2022-02-11  466  					"Couldn't get decoder for=
 %s\n",
5c4ecc7471fee0 Ben Widawsky 2022-02-11  467  					dev_name(&hb->dev));
5c4ecc7471fee0 Ben Widawsky 2022-02-11  468  				goto err;
5c4ecc7471fee0 Ben Widawsky 2022-02-11  469  			}
5c4ecc7471fee0 Ben Widawsky 2022-02-11  470  			cxld->interleave_ways =3D 0;
5c4ecc7471fee0 Ben Widawsky 2022-02-11  471  			cxld->interleave_granularit=
y =3D region_granularity(cxlr);
5c4ecc7471fee0 Ben Widawsky 2022-02-11  472  		} else {
5c4ecc7471fee0 Ben Widawsky 2022-02-11  473  			cxld =3D NULL;
5c4ecc7471fee0 Ben Widawsky 2022-02-11  474  		}
5c4ecc7471fee0 Ben Widawsky 2022-02-11  475  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  476  		/*
00b0519c6f9af5 Ben Widawsky 2022-02-11  477  		 * Calculate the position ma=
sk: NumRootPorts =3D 2^PositionMask
00b0519c6f9af5 Ben Widawsky 2022-02-11  478  		 * for this region.
00b0519c6f9af5 Ben Widawsky 2022-02-11  479  		 *
00b0519c6f9af5 Ben Widawsky 2022-02-11  480  		 * XXX: pos_mask is actually=
 (1 << PositionMask)  - 1
00b0519c6f9af5 Ben Widawsky 2022-02-11  481  		 */
00b0519c6f9af5 Ben Widawsky 2022-02-11  482  		position_mask =3D (1 << (ilo=
g2(num_root_ports))) - 1;
00b0519c6f9af5 Ben Widawsky 2022-02-11  483  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  484  		/*
00b0519c6f9af5 Ben Widawsky 2022-02-11  485  		 * Calculate the PortGroupin=
g for each device on this CXL Host
00b0519c6f9af5 Ben Widawsky 2022-02-11  486  		 * Bridge Root Port:
00b0519c6f9af5 Ben Widawsky 2022-02-11  487  		 * PortGrouping =3D RegionLa=
bel.Position & PositionMask
00b0519c6f9af5 Ben Widawsky 2022-02-11  488  		 *
00b0519c6f9af5 Ben Widawsky 2022-02-11  489  		 * The following nest iterat=
ors effectively iterate over each
00b0519c6f9af5 Ben Widawsky 2022-02-11  490  		 * root port in the region.
00b0519c6f9af5 Ben Widawsky 2022-02-11  491  		 *   for_each_unique_rootpor=
t(rp, cxlr)
00b0519c6f9af5 Ben Widawsky 2022-02-11  492  		 */
00b0519c6f9af5 Ben Widawsky 2022-02-11  493  		list_for_each_entry(rp, &hb-=
>dports, list) {
00b0519c6f9af5 Ben Widawsky 2022-02-11  494  			struct cxl_memdev *ep;
00b0519c6f9af5 Ben Widawsky 2022-02-11  495  			int port_grouping =3D -1;
50b9ca060c8e48 Ben Widawsky 2022-02-11  496  			int target_ndx;
00b0519c6f9af5 Ben Widawsky 2022-02-11  497  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  498  			for_each_cxl_endpoint_hb(ep=
, cxlr, hb, idx) {
50b9ca060c8e48 Ben Widawsky 2022-02-11  499  				struct cxl_decoder *switch=
_cxld;
50b9ca060c8e48 Ben Widawsky 2022-02-11  500  				struct cxl_dport *target;
50b9ca060c8e48 Ben Widawsky 2022-02-11  501  				struct cxl_port *switch_po=
rt;
50b9ca060c8e48 Ben Widawsky 2022-02-11  502  				bool found =3D false;
50b9ca060c8e48 Ben Widawsky 2022-02-11  503  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  504  				if (get_rp(ep) !=3D rp)
00b0519c6f9af5 Ben Widawsky 2022-02-11  505  					continue;
00b0519c6f9af5 Ben Widawsky 2022-02-11  506  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  507  				if (port_grouping =3D=3D -=
1)
00b0519c6f9af5 Ben Widawsky 2022-02-11  508  					port_grouping =3D idx & p=
osition_mask;
00b0519c6f9af5 Ben Widawsky 2022-02-11  509  =

00b0519c6f9af5 Ben Widawsky 2022-02-11  510  				/*
00b0519c6f9af5 Ben Widawsky 2022-02-11  511  				 * Do all devices in the r=
egion connected to this CXL
00b0519c6f9af5 Ben Widawsky 2022-02-11  512  				 * Host Bridge Root Port h=
ave the same PortGrouping?
00b0519c6f9af5 Ben Widawsky 2022-02-11  513  				 */
00b0519c6f9af5 Ben Widawsky 2022-02-11  514  				if ((idx & position_mask) =
!=3D port_grouping) {
00b0519c6f9af5 Ben Widawsky 2022-02-11  515  					dev_dbg(&cxlr->dev,
00b0519c6f9af5 Ben Widawsky 2022-02-11  516  						"One or more devices are=
 not connected to the correct Host Bridge Root Port\n");
5c4ecc7471fee0 Ben Widawsky 2022-02-11  517  					goto err;
00b0519c6f9af5 Ben Widawsky 2022-02-11  518  				}
0184ca5ccb0827 Ben Widawsky 2022-02-11  519  =

0184ca5ccb0827 Ben Widawsky 2022-02-11  520  				if (!state_update)
0184ca5ccb0827 Ben Widawsky 2022-02-11  521  					continue;
0184ca5ccb0827 Ben Widawsky 2022-02-11  522  =

0184ca5ccb0827 Ben Widawsky 2022-02-11  523  				if (dev_WARN_ONCE(&cxld->d=
ev,
0184ca5ccb0827 Ben Widawsky 2022-02-11  524  						  port_grouping >=3D cxl=
d->nr_targets,
0184ca5ccb0827 Ben Widawsky 2022-02-11  525  						  "Invalid port grouping=
 %d/%d\n",
0184ca5ccb0827 Ben Widawsky 2022-02-11  526  						  port_grouping, cxld->n=
r_targets))
0184ca5ccb0827 Ben Widawsky 2022-02-11  527  					goto err;
0184ca5ccb0827 Ben Widawsky 2022-02-11  528  =

0184ca5ccb0827 Ben Widawsky 2022-02-11  529  				cxld->interleave_ways++;
0184ca5ccb0827 Ben Widawsky 2022-02-11  530  				cxld->target[port_grouping=
] =3D get_rp(ep);
50b9ca060c8e48 Ben Widawsky 2022-02-11  531  =

50b9ca060c8e48 Ben Widawsky 2022-02-11  532  				/*
50b9ca060c8e48 Ben Widawsky 2022-02-11  533  				 * At least one switch is =
connected here if the endpoint
50b9ca060c8e48 Ben Widawsky 2022-02-11  534  				 * has a depth > 2
50b9ca060c8e48 Ben Widawsky 2022-02-11  535  				 */
50b9ca060c8e48 Ben Widawsky 2022-02-11  536  				if (ep->port->depth =3D=3D=
 2)
50b9ca060c8e48 Ben Widawsky 2022-02-11  537  					continue;
50b9ca060c8e48 Ben Widawsky 2022-02-11  538  =

50b9ca060c8e48 Ben Widawsky 2022-02-11  539  				/* Check the staged list t=
o see if this
50b9ca060c8e48 Ben Widawsky 2022-02-11  540  				 * port has already been a=
dded
50b9ca060c8e48 Ben Widawsky 2022-02-11  541  				 */
50b9ca060c8e48 Ben Widawsky 2022-02-11  542  				switch_port =3D get_switch=
(ep);
50b9ca060c8e48 Ben Widawsky 2022-02-11 @543  				list_for_each_entry(switch=
_cxld, &cxlr->staged_list, region_link) {
50b9ca060c8e48 Ben Widawsky 2022-02-11  544  					if (to_cxl_port(switch_cx=
ld->dev.parent) =3D=3D switch_port)
50b9ca060c8e48 Ben Widawsky 2022-02-11  545  						found =3D true;
50b9ca060c8e48 Ben Widawsky 2022-02-11  546  				}
50b9ca060c8e48 Ben Widawsky 2022-02-11  547  =

50b9ca060c8e48 Ben Widawsky 2022-02-11  548  				if (found) {
50b9ca060c8e48 Ben Widawsky 2022-02-11  549  					target =3D cxl_find_dport=
_by_dev(switch_port, ep->dev.parent->parent);
50b9ca060c8e48 Ben Widawsky 2022-02-11 @550  					switch_cxld->target[targe=
t_ndx++] =3D target;
50b9ca060c8e48 Ben Widawsky 2022-02-11  551  					continue;
50b9ca060c8e48 Ben Widawsky 2022-02-11  552  				}
50b9ca060c8e48 Ben Widawsky 2022-02-11  553  =

50b9ca060c8e48 Ben Widawsky 2022-02-11  554  				target_ndx =3D 0;
50b9ca060c8e48 Ben Widawsky 2022-02-11  555  =

50b9ca060c8e48 Ben Widawsky 2022-02-11  556  				switch_cxld =3D get_decode=
r(cxlr, switch_port);
50b9ca060c8e48 Ben Widawsky 2022-02-11  557  				switch_cxld->interleave_wa=
ys++;
50b9ca060c8e48 Ben Widawsky 2022-02-11  558  				switch_cxld->interleave_gr=
anularity =3D cxl_to_ways(region_ig + region_eniw);
00b0519c6f9af5 Ben Widawsky 2022-02-11  559  			}
00b0519c6f9af5 Ben Widawsky 2022-02-11  560  		}
00b0519c6f9af5 Ben Widawsky 2022-02-11  561  	}
00b0519c6f9af5 Ben Widawsky 2022-02-11  562  =

e3a336d0e7c1ec Ben Widawsky 2022-02-11  563  	return true;
5c4ecc7471fee0 Ben Widawsky 2022-02-11  564  =

5c4ecc7471fee0 Ben Widawsky 2022-02-11  565  err:
5c4ecc7471fee0 Ben Widawsky 2022-02-11  566  	dev_dbg(&cxlr->dev, "Couldn't=
 get decoder for region\n");
5c4ecc7471fee0 Ben Widawsky 2022-02-11  567  	list_for_each_entry_safe(cxld=
, c, &cxlr->staged_list, region_link)
5c4ecc7471fee0 Ben Widawsky 2022-02-11  568  		cxl_put_decoder(cxld);
5c4ecc7471fee0 Ben Widawsky 2022-02-11  569  =

5c4ecc7471fee0 Ben Widawsky 2022-02-11  570  	return false;
e3a336d0e7c1ec Ben Widawsky 2022-02-11  571  }
e3a336d0e7c1ec Ben Widawsky 2022-02-11  572  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3070457564251934628==--

