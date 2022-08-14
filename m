Content-Type: multipart/mixed; boundary="===============2758642426746151984=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:142 mlx5_eswitch_set_rule_source_port() warn: variable dereferenced before check 'attr' (see line 130)
Date: Mon, 15 Aug 2022 04:26:40 +0800
Message-ID: <202208150418.3WdXNdnr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2758642426746151984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ariel Levkovich <lariel@nvidia.com>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Maor Dickman <maord@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d6a0f4da9275f6c212de33777778673ba91241a
commit: cb0d54cbf94866b48a73e10a73a55655f808cc7c net/mlx5e: Fix wrong sourc=
e vport matching on tunnel rule
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: parisc-randconfig-m031-20220807 (https://download.01.org/0day-ci/ar=
chive/20220815/202208150418.3WdXNdnr-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c:142 mlx5_eswitch=
_set_rule_source_port() warn: variable dereferenced before check 'attr' (se=
e line 130)

vim +/attr +142 drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c

f94d6389f6a8ab Chris Mi        2020-09-21  122  =

c01cfd0f111511 Jianbo Liu      2019-06-25  123  static void
c01cfd0f111511 Jianbo Liu      2019-06-25  124  mlx5_eswitch_set_rule_sourc=
e_port(struct mlx5_eswitch *esw,
c01cfd0f111511 Jianbo Liu      2019-06-25  125  				  struct mlx5_flow_spec=
 *spec,
a508728a4c8bfa Vlad Buslov     2021-01-25  126  				  struct mlx5_flow_attr=
 *attr,
b055ecf5827d81 Mark Bloch      2020-10-12  127  				  struct mlx5_eswitch *=
src_esw,
b055ecf5827d81 Mark Bloch      2020-10-12  128  				  u16 vport)
c01cfd0f111511 Jianbo Liu      2019-06-25  129  {
166f431ec6beaf Ariel Levkovich 2021-04-29 @130  	struct mlx5_esw_flow_attr =
*esw_attr =3D attr->esw_attr;
166f431ec6beaf Ariel Levkovich 2021-04-29  131  	u32 metadata;
c01cfd0f111511 Jianbo Liu      2019-06-25  132  	void *misc2;
c01cfd0f111511 Jianbo Liu      2019-06-25  133  	void *misc;
c01cfd0f111511 Jianbo Liu      2019-06-25  134  =

c01cfd0f111511 Jianbo Liu      2019-06-25  135  	/* Use metadata matching b=
ecause vport is not represented by single
c01cfd0f111511 Jianbo Liu      2019-06-25  136  	 * VHCA in dual-port RoCE =
mode, and matching on source vport may fail.
c01cfd0f111511 Jianbo Liu      2019-06-25  137  	 */
c01cfd0f111511 Jianbo Liu      2019-06-25  138  	if (mlx5_eswitch_vport_mat=
ch_metadata_enabled(esw)) {
a508728a4c8bfa Vlad Buslov     2021-01-25  139  		if (mlx5_esw_indir_table_=
decap_vport(attr))
a508728a4c8bfa Vlad Buslov     2021-01-25  140  			vport =3D mlx5_esw_indir=
_table_decap_vport(attr);
166f431ec6beaf Ariel Levkovich 2021-04-29  141  =

cb0d54cbf94866 Ariel Levkovich 2022-03-15 @142  		if (attr && !attr->chain =
&& esw_attr->int_port)
166f431ec6beaf Ariel Levkovich 2021-04-29  143  			metadata =3D
166f431ec6beaf Ariel Levkovich 2021-04-29  144  				mlx5e_tc_int_port_get_m=
etadata_for_match(esw_attr->int_port);
166f431ec6beaf Ariel Levkovich 2021-04-29  145  		else
166f431ec6beaf Ariel Levkovich 2021-04-29  146  			metadata =3D
166f431ec6beaf Ariel Levkovich 2021-04-29  147  				mlx5_eswitch_get_vport_=
metadata_for_match(src_esw, vport);
166f431ec6beaf Ariel Levkovich 2021-04-29  148  =

c01cfd0f111511 Jianbo Liu      2019-06-25  149  		misc2 =3D MLX5_ADDR_OF(ft=
e_match_param, spec->match_value, misc_parameters_2);
166f431ec6beaf Ariel Levkovich 2021-04-29  150  		MLX5_SET(fte_match_set_mi=
sc2, misc2, metadata_reg_c_0, metadata);
c01cfd0f111511 Jianbo Liu      2019-06-25  151  =

c01cfd0f111511 Jianbo Liu      2019-06-25  152  		misc2 =3D MLX5_ADDR_OF(ft=
e_match_param, spec->match_criteria, misc_parameters_2);
0f0d3827c0b4d6 Paul Blakey     2020-02-16  153  		MLX5_SET(fte_match_set_mi=
sc2, misc2, metadata_reg_c_0,
0f0d3827c0b4d6 Paul Blakey     2020-02-16  154  			 mlx5_eswitch_get_vport_=
metadata_mask());
c01cfd0f111511 Jianbo Liu      2019-06-25  155  =

c01cfd0f111511 Jianbo Liu      2019-06-25  156  		spec->match_criteria_enab=
le |=3D MLX5_MATCH_MISC_PARAMETERS_2;
c01cfd0f111511 Jianbo Liu      2019-06-25  157  	} else {
c01cfd0f111511 Jianbo Liu      2019-06-25  158  		misc =3D MLX5_ADDR_OF(fte=
_match_param, spec->match_value, misc_parameters);
b055ecf5827d81 Mark Bloch      2020-10-12  159  		MLX5_SET(fte_match_set_mi=
sc, misc, source_port, vport);
c01cfd0f111511 Jianbo Liu      2019-06-25  160  =

c01cfd0f111511 Jianbo Liu      2019-06-25  161  		if (MLX5_CAP_ESW(esw->dev=
, merged_eswitch))
c01cfd0f111511 Jianbo Liu      2019-06-25  162  			MLX5_SET(fte_match_set_m=
isc, misc,
c01cfd0f111511 Jianbo Liu      2019-06-25  163  				 source_eswitch_owner_v=
hca_id,
b055ecf5827d81 Mark Bloch      2020-10-12  164  				 MLX5_CAP_GEN(src_esw->=
dev, vhca_id));
c01cfd0f111511 Jianbo Liu      2019-06-25  165  =

c01cfd0f111511 Jianbo Liu      2019-06-25  166  		misc =3D MLX5_ADDR_OF(fte=
_match_param, spec->match_criteria, misc_parameters);
c01cfd0f111511 Jianbo Liu      2019-06-25  167  		MLX5_SET_TO_ONES(fte_matc=
h_set_misc, misc, source_port);
c01cfd0f111511 Jianbo Liu      2019-06-25  168  		if (MLX5_CAP_ESW(esw->dev=
, merged_eswitch))
c01cfd0f111511 Jianbo Liu      2019-06-25  169  			MLX5_SET_TO_ONES(fte_mat=
ch_set_misc, misc,
c01cfd0f111511 Jianbo Liu      2019-06-25  170  					 source_eswitch_owner_=
vhca_id);
c01cfd0f111511 Jianbo Liu      2019-06-25  171  =

c01cfd0f111511 Jianbo Liu      2019-06-25  172  		spec->match_criteria_enab=
le |=3D MLX5_MATCH_MISC_PARAMETERS;
c01cfd0f111511 Jianbo Liu      2019-06-25  173  	}
c01cfd0f111511 Jianbo Liu      2019-06-25  174  }
c01cfd0f111511 Jianbo Liu      2019-06-25  175  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2758642426746151984==--

