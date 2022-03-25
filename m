Content-Type: multipart/mixed; boundary="===============9035560113724242065=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/dp/drm_dp_mst_topology.c:4498 drm_dp_atomic_release_vcpi_slots() warn: iterator used outside loop: 'pos'
Date: Sat, 26 Mar 2022 03:50:45 +0800
Message-ID: <202203260311.ak09WUa8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9035560113724242065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   34af78c4e616c359ed428d79fe4758a35d2c5473
commit: adb9d5a2cc77e8aefe98fe4c11656c5b7025c248 drm/dp: Move DisplayPort h=
elpers into separate helper module
date:   10 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 weeks ago
config: powerpc64-randconfig-m031-20220325 (https://download.01.org/0day-ci=
/archive/20220326/202203260311.ak09WUa8-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/dp/drm_dp_mst_topology.c:4498 drm_dp_atomic_release_vcpi_sl=
ots() warn: iterator used outside loop: 'pos'

vim +/pos +4498 drivers/gpu/drm/dp/drm_dp_mst_topology.c

edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4447  =

edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4448  /**
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4449   * drm_dp_atomic_release_vcpi_slots() - Release allocated =
vcpi slots
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4450   * @state: global atomic state
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4451   * @mgr: MST topology manager for the port
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4452   * @port: The port to release the VCPI slots from
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4453   *
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4454   * Releases any VCPI slots that have been allocated to a p=
ort in the atomic
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4455   * state. Any atomic drivers which support MST must call t=
his function in
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4456   * their &drm_connector_helper_funcs.atomic_check() callba=
ck when the
1e55a53a28d3e5 drivers/gpu/drm/drm_dp_mst_topology.c Matt Roper           2=
019-02-01  4457   * connector will no longer have VCPI allocated (e.g. beca=
use its CRTC was
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4458   * removed) when it had VCPI allocated in the previous ato=
mic state.
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4459   *
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4460   * It is OK to call this even if @port has been removed fr=
om the system.
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4461   * Additionally, it is OK to call this function multiple t=
imes on the same
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4462   * @port as needed. It is not OK however, to call this fun=
ction and
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4463   * drm_dp_atomic_find_vcpi_slots() on the same @port in a =
single atomic check
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4464   * phase.
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4465   *
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4466   * See also:
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4467   * drm_dp_atomic_find_vcpi_slots()
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4468   * drm_dp_mst_atomic_check()
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4469   *
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4470   * Returns:
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4471   * 0 if all slots for this port were added back to
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4472   * &drm_dp_mst_topology_state.avail_slots or negative erro=
r code
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4473   */
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4474  int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_sta=
te *state,
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4475  				     struct drm_dp_mst_topology_mgr *mgr,
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4476  				     struct drm_dp_mst_port *port)
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4477  {
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4478  	struct drm_dp_mst_topology_state *topology_state;
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4479  	struct drm_dp_vcpi_allocation *pos;
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4480  	bool found =3D false;
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4481  =

edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4482  	topology_state =3D drm_atomic_get_mst_topology_state(stat=
e, mgr);
56a91c4932bd03 drivers/gpu/drm/drm_dp_mst_topology.c Ville Syrj=C3=A4l=C3=
=A4        2017-07-12  4483  	if (IS_ERR(topology_state))
56a91c4932bd03 drivers/gpu/drm/drm_dp_mst_topology.c Ville Syrj=C3=A4l=C3=
=A4        2017-07-12  4484  		return PTR_ERR(topology_state);
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4485  =

eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4486  	list_for_each_entry(pos, &topology_state->vcpis, next) {
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4487  		if (pos->port =3D=3D port) {
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4488  			found =3D true;
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4489  			break;
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4490  		}
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4491  	}
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4492  	if (WARN_ON(!found)) {
3a08f53dcf17e7 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
021-04-23  4493  		drm_err(mgr->dev, "no VCPI for [MST PORT:%p] found in ms=
t state %p\n",
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4494  			port, &topology_state->base);
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4495  		return -EINVAL;
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4496  	}
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4497  =

3a08f53dcf17e7 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
021-04-23 @4498  	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] VCPI %d -> 0\n", =
port, pos->vcpi);
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4499  	if (pos->vcpi) {
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4500  		drm_dp_mst_put_port_malloc(port);
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4501  		pos->vcpi =3D 0;
7bfc1fec1af3e2 drivers/gpu/drm/drm_dp_mst_topology.c Mikita Lipski        2=
020-04-07  4502  		pos->pbn =3D 0;
eceae147246749 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul           2=
019-01-10  4503  	}
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4504  =

edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4505  	return 0;
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4506  }
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4507  EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
edb1ed1ab7d314 drivers/gpu/drm/drm_dp_mst_topology.c Pandiyan, Dhinakaran 2=
017-04-20  4508  =


:::::: The code at line 4498 was first introduced by commit
:::::: 3a08f53dcf17e7cbdc6143e88791b3a10d0fdd48 drm/dp_mst: Convert drm_dp_=
mst_topology.c to drm_err()/drm_dbg*()

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Lyude Paul <lyude@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9035560113724242065==--

