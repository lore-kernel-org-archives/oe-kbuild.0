Content-Type: multipart/mixed; boundary="===============1114559625693696739=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_flow.c:804 ice_flow_xtract_fld() warn: should '((((1))) << sib)' be a 64 bit type?
Date: Fri, 11 Feb 2022 05:28:17 +0800
Message-ID: <202202110535.MP0tagZF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1114559625693696739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Qi Zhang <qi.z.zhang@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Ting Xu <ting.xu@intel.com>
CC: Yahui Cao <yahui.cao@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e3c85076d7a6f986445b9008be7e7f83d1b0780a
commit: 0577313e53887493232206f1afe2a6584fa5e585 ice: Add more advanced pro=
tocol support in flow filter
date:   11 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-m031-20220130 (https://download.01.org/0day-ci/a=
rchive/20220211/202202110535.MP0tagZF-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/intel/ice/ice_flow.c:804 ice_flow_xtract_fld() warn: s=
hould '((((1))) << sib)' be a 64 bit type?

Old smatch warnings:
drivers/net/ethernet/intel/ice/ice_flow.c:823 ice_flow_xtract_fld() warn: s=
hould '((((1))) << sib)' be a 64 bit type?
drivers/net/ethernet/intel/ice/ice_flow.c:923 ice_flow_xtract_fld() error: =
testing array offset 'sib' after use.
drivers/net/ethernet/intel/ice/ice_flow.c:1959 ice_add_rss_cfg_sync() error=
: we previously assumed 'prof' could be null (see line 1941)

vim +804 drivers/net/ethernet/intel/ice/ice_flow.c

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  744  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  745  /**
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  746   * ice_flow_xtract_fl=
d - Create an extraction sequence entry for the given field
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  747   * @hw: pointer to th=
e HW struct
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  748   * @params: informati=
on about the flow to be processed
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  749   * @seg: packet segme=
nt index of the field to be extracted
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  750   * @fld: ID of field =
to be extracted
b199dddbd39953 Qi Zhang              2021-03-09  751   * @match: bit field =
of all fields
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  752   *
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  753   * This function dete=
rmines the protocol ID, offset, and size of the given
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  754   * field. It then all=
ocates one or more extraction sequence entries for the
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  755   * given field, and f=
ill the entries with protocol ID and offset information.
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  756   */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  757  static enum ice_status
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  758  ice_flow_xtract_fld(s=
truct ice_hw *hw, struct ice_flow_prof_params *params,
b199dddbd39953 Qi Zhang              2021-03-09  759  		    u8 seg, enum ic=
e_flow_field fld, u64 match)
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  760  {
b199dddbd39953 Qi Zhang              2021-03-09  761  	enum ice_flow_field =
sib =3D ICE_FLOW_FIELD_IDX_MAX;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  762  	enum ice_prot_id pro=
t_id =3D ICE_PROT_ID_INVAL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  763  	u8 fv_words =3D hw->=
blk[params->blk].es.fvw;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  764  	struct ice_flow_fld_=
info *flds;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  765  	u16 cnt, ese_bits, i;
b199dddbd39953 Qi Zhang              2021-03-09  766  	u16 sib_mask =3D 0;
b199dddbd39953 Qi Zhang              2021-03-09  767  	u16 mask;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  768  	u16 off;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  769  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  770  	flds =3D params->pro=
f->segs[seg].fields;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  771  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  772  	switch (fld) {
390bd141808d50 Qi Zhang              2021-03-09  773  	case ICE_FLOW_FIELD_=
IDX_ETH_DA:
390bd141808d50 Qi Zhang              2021-03-09  774  	case ICE_FLOW_FIELD_=
IDX_ETH_SA:
390bd141808d50 Qi Zhang              2021-03-09  775  	case ICE_FLOW_FIELD_=
IDX_S_VLAN:
390bd141808d50 Qi Zhang              2021-03-09  776  	case ICE_FLOW_FIELD_=
IDX_C_VLAN:
390bd141808d50 Qi Zhang              2021-03-09  777  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_MAC_OF_OR_S : ICE_PROT_MAC_IL;
390bd141808d50 Qi Zhang              2021-03-09  778  		break;
390bd141808d50 Qi Zhang              2021-03-09  779  	case ICE_FLOW_FIELD_=
IDX_ETH_TYPE:
390bd141808d50 Qi Zhang              2021-03-09  780  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_ETYPE_OL : ICE_PROT_ETYPE_IL;
390bd141808d50 Qi Zhang              2021-03-09  781  		break;
b199dddbd39953 Qi Zhang              2021-03-09  782  	case ICE_FLOW_FIELD_=
IDX_IPV4_DSCP:
b199dddbd39953 Qi Zhang              2021-03-09  783  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV4_OF_OR_S : ICE_PROT_IPV4_IL;
b199dddbd39953 Qi Zhang              2021-03-09  784  		break;
b199dddbd39953 Qi Zhang              2021-03-09  785  	case ICE_FLOW_FIELD_=
IDX_IPV6_DSCP:
b199dddbd39953 Qi Zhang              2021-03-09  786  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV6_OF_OR_S : ICE_PROT_IPV6_IL;
b199dddbd39953 Qi Zhang              2021-03-09  787  		break;
b199dddbd39953 Qi Zhang              2021-03-09  788  	case ICE_FLOW_FIELD_=
IDX_IPV4_TTL:
b199dddbd39953 Qi Zhang              2021-03-09  789  	case ICE_FLOW_FIELD_=
IDX_IPV4_PROT:
b199dddbd39953 Qi Zhang              2021-03-09  790  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV4_OF_OR_S : ICE_PROT_IPV4_IL;
b199dddbd39953 Qi Zhang              2021-03-09  791  =

b199dddbd39953 Qi Zhang              2021-03-09  792  		/* TTL and PROT sha=
re the same extraction seq. entry.
b199dddbd39953 Qi Zhang              2021-03-09  793  		 * Each is consider=
ed a sibling to the other in terms of sharing
b199dddbd39953 Qi Zhang              2021-03-09  794  		 * the same extract=
ion sequence entry.
b199dddbd39953 Qi Zhang              2021-03-09  795  		 */
b199dddbd39953 Qi Zhang              2021-03-09  796  		if (fld =3D=3D ICE_=
FLOW_FIELD_IDX_IPV4_TTL)
b199dddbd39953 Qi Zhang              2021-03-09  797  			sib =3D ICE_FLOW_F=
IELD_IDX_IPV4_PROT;
b199dddbd39953 Qi Zhang              2021-03-09  798  		else if (fld =3D=3D=
 ICE_FLOW_FIELD_IDX_IPV4_PROT)
b199dddbd39953 Qi Zhang              2021-03-09  799  			sib =3D ICE_FLOW_F=
IELD_IDX_IPV4_TTL;
b199dddbd39953 Qi Zhang              2021-03-09  800  =

b199dddbd39953 Qi Zhang              2021-03-09  801  		/* If the sibling f=
ield is also included, that field's
b199dddbd39953 Qi Zhang              2021-03-09  802  		 * mask needs to be=
 included.
b199dddbd39953 Qi Zhang              2021-03-09  803  		 */
b199dddbd39953 Qi Zhang              2021-03-09 @804  		if (match & BIT(sib=
))
b199dddbd39953 Qi Zhang              2021-03-09  805  			sib_mask =3D ice_f=
lds_info[sib].mask;
b199dddbd39953 Qi Zhang              2021-03-09  806  		break;
b199dddbd39953 Qi Zhang              2021-03-09  807  	case ICE_FLOW_FIELD_=
IDX_IPV6_TTL:
b199dddbd39953 Qi Zhang              2021-03-09  808  	case ICE_FLOW_FIELD_=
IDX_IPV6_PROT:
b199dddbd39953 Qi Zhang              2021-03-09  809  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV6_OF_OR_S : ICE_PROT_IPV6_IL;
b199dddbd39953 Qi Zhang              2021-03-09  810  =

b199dddbd39953 Qi Zhang              2021-03-09  811  		/* TTL and PROT sha=
re the same extraction seq. entry.
b199dddbd39953 Qi Zhang              2021-03-09  812  		 * Each is consider=
ed a sibling to the other in terms of sharing
b199dddbd39953 Qi Zhang              2021-03-09  813  		 * the same extract=
ion sequence entry.
b199dddbd39953 Qi Zhang              2021-03-09  814  		 */
b199dddbd39953 Qi Zhang              2021-03-09  815  		if (fld =3D=3D ICE_=
FLOW_FIELD_IDX_IPV6_TTL)
b199dddbd39953 Qi Zhang              2021-03-09  816  			sib =3D ICE_FLOW_F=
IELD_IDX_IPV6_PROT;
b199dddbd39953 Qi Zhang              2021-03-09  817  		else if (fld =3D=3D=
 ICE_FLOW_FIELD_IDX_IPV6_PROT)
b199dddbd39953 Qi Zhang              2021-03-09  818  			sib =3D ICE_FLOW_F=
IELD_IDX_IPV6_TTL;
b199dddbd39953 Qi Zhang              2021-03-09  819  =

b199dddbd39953 Qi Zhang              2021-03-09  820  		/* If the sibling f=
ield is also included, that field's
b199dddbd39953 Qi Zhang              2021-03-09  821  		 * mask needs to be=
 included.
b199dddbd39953 Qi Zhang              2021-03-09  822  		 */
b199dddbd39953 Qi Zhang              2021-03-09  823  		if (match & BIT(sib=
))
b199dddbd39953 Qi Zhang              2021-03-09  824  			sib_mask =3D ice_f=
lds_info[sib].mask;
b199dddbd39953 Qi Zhang              2021-03-09  825  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  826  	case ICE_FLOW_FIELD_=
IDX_IPV4_SA:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  827  	case ICE_FLOW_FIELD_=
IDX_IPV4_DA:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  828  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV4_OF_OR_S : ICE_PROT_IPV4_IL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  829  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  830  	case ICE_FLOW_FIELD_=
IDX_IPV6_SA:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  831  	case ICE_FLOW_FIELD_=
IDX_IPV6_DA:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  832  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV6_OF_OR_S : ICE_PROT_IPV6_IL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  833  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  834  	case ICE_FLOW_FIELD_=
IDX_TCP_SRC_PORT:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  835  	case ICE_FLOW_FIELD_=
IDX_TCP_DST_PORT:
390bd141808d50 Qi Zhang              2021-03-09  836  	case ICE_FLOW_FIELD_=
IDX_TCP_FLAGS:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  837  		prot_id =3D ICE_PRO=
T_TCP_IL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  838  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  839  	case ICE_FLOW_FIELD_=
IDX_UDP_SRC_PORT:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  840  	case ICE_FLOW_FIELD_=
IDX_UDP_DST_PORT:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  841  		prot_id =3D ICE_PRO=
T_UDP_IL_OR_S;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  842  		break;
1c01c8c6c969a9 Md Fahad Iqbal Polash 2020-01-17  843  	case ICE_FLOW_FIELD_=
IDX_SCTP_SRC_PORT:
1c01c8c6c969a9 Md Fahad Iqbal Polash 2020-01-17  844  	case ICE_FLOW_FIELD_=
IDX_SCTP_DST_PORT:
1c01c8c6c969a9 Md Fahad Iqbal Polash 2020-01-17  845  		prot_id =3D ICE_PRO=
T_SCTP_IL;
1c01c8c6c969a9 Md Fahad Iqbal Polash 2020-01-17  846  		break;
0577313e538874 Qi Zhang              2021-03-09  847  	case ICE_FLOW_FIELD_=
IDX_GTPC_TEID:
0577313e538874 Qi Zhang              2021-03-09  848  	case ICE_FLOW_FIELD_=
IDX_GTPU_IP_TEID:
0577313e538874 Qi Zhang              2021-03-09  849  	case ICE_FLOW_FIELD_=
IDX_GTPU_UP_TEID:
0577313e538874 Qi Zhang              2021-03-09  850  	case ICE_FLOW_FIELD_=
IDX_GTPU_DWN_TEID:
0577313e538874 Qi Zhang              2021-03-09  851  	case ICE_FLOW_FIELD_=
IDX_GTPU_EH_TEID:
0577313e538874 Qi Zhang              2021-03-09  852  	case ICE_FLOW_FIELD_=
IDX_GTPU_EH_QFI:
0577313e538874 Qi Zhang              2021-03-09  853  		/* GTP is accessed =
through UDP OF protocol */
0577313e538874 Qi Zhang              2021-03-09  854  		prot_id =3D ICE_PRO=
T_UDP_OF;
0577313e538874 Qi Zhang              2021-03-09  855  		break;
0577313e538874 Qi Zhang              2021-03-09  856  	case ICE_FLOW_FIELD_=
IDX_PPPOE_SESS_ID:
0577313e538874 Qi Zhang              2021-03-09  857  		prot_id =3D ICE_PRO=
T_PPPOE;
0577313e538874 Qi Zhang              2021-03-09  858  		break;
0577313e538874 Qi Zhang              2021-03-09  859  	case ICE_FLOW_FIELD_=
IDX_PFCP_SEID:
0577313e538874 Qi Zhang              2021-03-09  860  		prot_id =3D ICE_PRO=
T_UDP_IL_OR_S;
0577313e538874 Qi Zhang              2021-03-09  861  		break;
0577313e538874 Qi Zhang              2021-03-09  862  	case ICE_FLOW_FIELD_=
IDX_L2TPV3_SESS_ID:
0577313e538874 Qi Zhang              2021-03-09  863  		prot_id =3D ICE_PRO=
T_L2TPV3;
0577313e538874 Qi Zhang              2021-03-09  864  		break;
0577313e538874 Qi Zhang              2021-03-09  865  	case ICE_FLOW_FIELD_=
IDX_ESP_SPI:
0577313e538874 Qi Zhang              2021-03-09  866  		prot_id =3D ICE_PRO=
T_ESP_F;
0577313e538874 Qi Zhang              2021-03-09  867  		break;
0577313e538874 Qi Zhang              2021-03-09  868  	case ICE_FLOW_FIELD_=
IDX_AH_SPI:
0577313e538874 Qi Zhang              2021-03-09  869  		prot_id =3D ICE_PRO=
T_ESP_2;
0577313e538874 Qi Zhang              2021-03-09  870  		break;
0577313e538874 Qi Zhang              2021-03-09  871  	case ICE_FLOW_FIELD_=
IDX_NAT_T_ESP_SPI:
0577313e538874 Qi Zhang              2021-03-09  872  		prot_id =3D ICE_PRO=
T_UDP_IL_OR_S;
0577313e538874 Qi Zhang              2021-03-09  873  		break;
390bd141808d50 Qi Zhang              2021-03-09  874  	case ICE_FLOW_FIELD_=
IDX_ARP_SIP:
390bd141808d50 Qi Zhang              2021-03-09  875  	case ICE_FLOW_FIELD_=
IDX_ARP_DIP:
390bd141808d50 Qi Zhang              2021-03-09  876  	case ICE_FLOW_FIELD_=
IDX_ARP_SHA:
390bd141808d50 Qi Zhang              2021-03-09  877  	case ICE_FLOW_FIELD_=
IDX_ARP_DHA:
390bd141808d50 Qi Zhang              2021-03-09  878  	case ICE_FLOW_FIELD_=
IDX_ARP_OP:
390bd141808d50 Qi Zhang              2021-03-09  879  		prot_id =3D ICE_PRO=
T_ARP_OF;
390bd141808d50 Qi Zhang              2021-03-09  880  		break;
390bd141808d50 Qi Zhang              2021-03-09  881  	case ICE_FLOW_FIELD_=
IDX_ICMP_TYPE:
390bd141808d50 Qi Zhang              2021-03-09  882  	case ICE_FLOW_FIELD_=
IDX_ICMP_CODE:
390bd141808d50 Qi Zhang              2021-03-09  883  		/* ICMP type and co=
de share the same extraction seq. entry */
390bd141808d50 Qi Zhang              2021-03-09  884  		prot_id =3D (params=
->prof->segs[seg].hdrs & ICE_FLOW_SEG_HDR_IPV4) ?
390bd141808d50 Qi Zhang              2021-03-09  885  				ICE_PROT_ICMP_IL =
: ICE_PROT_ICMPV6_IL;
b199dddbd39953 Qi Zhang              2021-03-09  886  		sib =3D fld =3D=3D =
ICE_FLOW_FIELD_IDX_ICMP_TYPE ?
b199dddbd39953 Qi Zhang              2021-03-09  887  			ICE_FLOW_FIELD_IDX=
_ICMP_CODE :
b199dddbd39953 Qi Zhang              2021-03-09  888  			ICE_FLOW_FIELD_IDX=
_ICMP_TYPE;
390bd141808d50 Qi Zhang              2021-03-09  889  		break;
a4e82a81f57387 Tony Nguyen           2020-05-06  890  	case ICE_FLOW_FIELD_=
IDX_GRE_KEYID:
a4e82a81f57387 Tony Nguyen           2020-05-06  891  		prot_id =3D ICE_PRO=
T_GRE_OF;
a4e82a81f57387 Tony Nguyen           2020-05-06  892  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  893  	default:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  894  		return ICE_ERR_NOT_=
IMPL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  895  	}
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  896  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  897  	/* Each extraction s=
equence entry is a word in size, and extracts a
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  898  	 * word-aligned offs=
et from a protocol header.
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  899  	 */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  900  	ese_bits =3D ICE_FLO=
W_FV_EXTRACT_SZ * BITS_PER_BYTE;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  901  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  902  	flds[fld].xtrct.prot=
_id =3D prot_id;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  903  	flds[fld].xtrct.off =
=3D (ice_flds_info[fld].off / ese_bits) *
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  904  		ICE_FLOW_FV_EXTRACT=
_SZ;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  905  	flds[fld].xtrct.disp=
 =3D (u8)(ice_flds_info[fld].off % ese_bits);
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  906  	flds[fld].xtrct.idx =
=3D params->es_cnt;
b199dddbd39953 Qi Zhang              2021-03-09  907  	flds[fld].xtrct.mask=
 =3D ice_flds_info[fld].mask;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  908  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  909  	/* Adjust the next f=
ield-entry index after accommodating the number of
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  910  	 * entries this fiel=
d consumes
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  911  	 */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  912  	cnt =3D DIV_ROUND_UP=
(flds[fld].xtrct.disp + ice_flds_info[fld].size,
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  913  			   ese_bits);
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  914  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  915  	/* Fill in the extra=
ction sequence entries needed for this field */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  916  	off =3D flds[fld].xt=
rct.off;
b199dddbd39953 Qi Zhang              2021-03-09  917  	mask =3D flds[fld].x=
trct.mask;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  918  	for (i =3D 0; i < cn=
t; i++) {
b199dddbd39953 Qi Zhang              2021-03-09  919  		/* Only consume an =
extraction sequence entry if there is no
b199dddbd39953 Qi Zhang              2021-03-09  920  		 * sibling field as=
sociated with this field or the sibling entry
b199dddbd39953 Qi Zhang              2021-03-09  921  		 * already extracts=
 the word shared with this field.
b199dddbd39953 Qi Zhang              2021-03-09  922  		 */
b199dddbd39953 Qi Zhang              2021-03-09  923  		if (sib =3D=3D ICE_=
FLOW_FIELD_IDX_MAX ||
b199dddbd39953 Qi Zhang              2021-03-09  924  		    flds[sib].xtrct=
.prot_id =3D=3D ICE_PROT_ID_INVAL ||
b199dddbd39953 Qi Zhang              2021-03-09  925  		    flds[sib].xtrct=
.off !=3D off) {
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  926  			u8 idx;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  927  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  928  			/* Make sure the n=
umber of extraction sequence required
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  929  			 * does not exceed=
 the block's capability
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  930  			 */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  931  			if (params->es_cnt=
 >=3D fv_words)
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  932  				return ICE_ERR_MA=
X_LIMIT;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  933  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  934  			/* some blocks req=
uire a reversed field vector layout */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  935  			if (hw->blk[params=
->blk].es.reverse)
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  936  				idx =3D fv_words =
- params->es_cnt - 1;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  937  			else
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  938  				idx =3D params->e=
s_cnt;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  939  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  940  			params->es[idx].pr=
ot_id =3D prot_id;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  941  			params->es[idx].of=
f =3D off;
b199dddbd39953 Qi Zhang              2021-03-09  942  			params->mask[idx] =
=3D mask | sib_mask;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  943  			params->es_cnt++;
b199dddbd39953 Qi Zhang              2021-03-09  944  		}
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  945  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  946  		off +=3D ICE_FLOW_F=
V_EXTRACT_SZ;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  947  	}
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  948  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  949  	return 0;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  950  }
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  951  =


:::::: The code at line 804 was first introduced by commit
:::::: b199dddbd399536d5470e10e6bfd7d0e1b5fb71a ice: Support non word align=
ed input set field

:::::: TO: Qi Zhang <qi.z.zhang@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1114559625693696739==--

