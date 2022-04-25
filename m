Content-Type: multipart/mixed; boundary="===============8612335907911066399=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-misc:for-linux-next 2/9] drivers/gpu/drm/display/drm_dp_mst_topology.c:4498:64-67: ERROR: invalid reference to the index variable of the iterator on line 4486
Date: Tue, 26 Apr 2022 04:27:35 +0800
Message-ID: <202204260404.JsTUt7Ee-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8612335907911066399==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Lyude Paul <lyude@redhat.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   644edf52b6305506ba7fd552323c1dfaa9cf6d8d
commit: da68386d9edb1f57abf886febe5c5169ebd4d2c9 [2/9] drm: Rename dp/ to d=
isplay/
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-c022-20220425 (https://download.01.org/0day-ci/ar=
chive/20220426/202204260404.JsTUt7Ee-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:4498:64-67: ERROR: invalid=
 reference to the index variable of the iterator on line 4486
   drivers/gpu/drm/display/drm_dp_mst_topology.c:5223:13-17: ERROR: invalid=
 reference to the index variable of the iterator on line 5200
   drivers/gpu/drm/display/drm_dp_mst_topology.c:5387:5-8: ERROR: invalid r=
eference to the index variable of the iterator on line 5373

vim +4498 drivers/gpu/drm/display/drm_dp_mst_topology.c

edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4447  =

edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4448  /**
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4449   * drm_dp_atomic_release_vcpi_slots() - Release allocated=
 vcpi slots
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4450   * @state: global atomic state
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4451   * @mgr: MST topology manager for the port
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4452   * @port: The port to release the VCPI slots from
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4453   *
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4454   * Releases any VCPI slots that have been allocated to a =
port in the atomic
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4455   * state. Any atomic drivers which support MST must call =
this function in
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4456   * their &drm_connector_helper_funcs.atomic_check() callb=
ack when the
1e55a53a28d3e52 drivers/gpu/drm/drm_dp_mst_topology.c Matt Roper           =
2019-02-01  4457   * connector will no longer have VCPI allocated (e.g. bec=
ause its CRTC was
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4458   * removed) when it had VCPI allocated in the previous at=
omic state.
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4459   *
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4460   * It is OK to call this even if @port has been removed f=
rom the system.
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4461   * Additionally, it is OK to call this function multiple =
times on the same
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4462   * @port as needed. It is not OK however, to call this fu=
nction and
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4463   * drm_dp_atomic_find_vcpi_slots() on the same @port in a=
 single atomic check
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4464   * phase.
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4465   *
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4466   * See also:
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4467   * drm_dp_atomic_find_vcpi_slots()
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4468   * drm_dp_mst_atomic_check()
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4469   *
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4470   * Returns:
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4471   * 0 if all slots for this port were added back to
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4472   * &drm_dp_mst_topology_state.avail_slots or negative err=
or code
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4473   */
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4474  int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_st=
ate *state,
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4475  				     struct drm_dp_mst_topology_mgr *mgr,
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4476  				     struct drm_dp_mst_port *port)
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4477  {
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4478  	struct drm_dp_mst_topology_state *topology_state;
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4479  	struct drm_dp_vcpi_allocation *pos;
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4480  	bool found =3D false;
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4481  =

edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4482  	topology_state =3D drm_atomic_get_mst_topology_state(sta=
te, mgr);
56a91c4932bd038 drivers/gpu/drm/drm_dp_mst_topology.c Ville Syrj=C3=A4l=C3=
=A4        2017-07-12  4483  	if (IS_ERR(topology_state))
56a91c4932bd038 drivers/gpu/drm/drm_dp_mst_topology.c Ville Syrj=C3=A4l=C3=
=A4        2017-07-12  4484  		return PTR_ERR(topology_state);
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4485  =

eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10 @4486  	list_for_each_entry(pos, &topology_state->vcpis, next) {
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4487  		if (pos->port =3D=3D port) {
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4488  			found =3D true;
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4489  			break;
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4490  		}
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4491  	}
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4492  	if (WARN_ON(!found)) {
3a08f53dcf17e7c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2021-04-23  4493  		drm_err(mgr->dev, "no VCPI for [MST PORT:%p] found in m=
st state %p\n",
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4494  			port, &topology_state->base);
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4495  		return -EINVAL;
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4496  	}
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4497  =

3a08f53dcf17e7c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2021-04-23 @4498  	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] VCPI %d -> 0\n",=
 port, pos->vcpi);
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4499  	if (pos->vcpi) {
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4500  		drm_dp_mst_put_port_malloc(port);
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4501  		pos->vcpi =3D 0;
7bfc1fec1af3e2f drivers/gpu/drm/drm_dp_mst_topology.c Mikita Lipski        =
2020-04-07  4502  		pos->pbn =3D 0;
eceae147246749c drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           =
2019-01-10  4503  	}
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4504  =

edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4505  	return 0;
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4506  }
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4507  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
edb1ed1ab7d314e drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran =
2017-04-20  4508  =


:::::: The code at line 4498 was first introduced by commit
:::::: 3a08f53dcf17e7cbdc6143e88791b3a10d0fdd48 drm/dp_mst: Convert drm_dp_=
mst_topology.c to drm_err()/drm_dbg*()

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Lyude Paul <lyude@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8612335907911066399==--

