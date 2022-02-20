Content-Type: multipart/mixed; boundary="===============0420576822759142007=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_flow.c:663 ice_flow_xtract_fld() error: testing array offset 'sib' after use.
Date: Mon, 21 Feb 2022 06:04:06 +0800
Message-ID: <202202210600.1bgZxgHc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0420576822759142007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Qi Zhang <qi.z.zhang@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Dan Nowlin <dan.nowlin@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   77478077349f14c78e30faeac358cf1187c0f0c1
commit: b199dddbd399536d5470e10e6bfd7d0e1b5fb71a ice: Support non word alig=
ned input set field
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: ia64-randconfig-m031-20220220 (https://download.01.org/0day-ci/arch=
ive/20220221/202202210600.1bgZxgHc-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/intel/ice/ice_flow.c:663 ice_flow_xtract_fld() error: =
testing array offset 'sib' after use.

Old smatch warnings:
drivers/net/ethernet/intel/ice/ice_flow.c:1698 ice_add_rss_cfg_sync() error=
: we previously assumed 'prof' could be null (see line 1680)

vim +/sib +663 drivers/net/ethernet/intel/ice/ice_flow.c

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  511  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  512  /**
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  513   * ice_flow_xtract_fl=
d - Create an extraction sequence entry for the given field
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  514   * @hw: pointer to th=
e HW struct
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  515   * @params: informati=
on about the flow to be processed
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  516   * @seg: packet segme=
nt index of the field to be extracted
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  517   * @fld: ID of field =
to be extracted
b199dddbd39953 Qi Zhang              2021-03-09  518   * @match: bit field =
of all fields
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  519   *
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  520   * This function dete=
rmines the protocol ID, offset, and size of the given
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  521   * field. It then all=
ocates one or more extraction sequence entries for the
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  522   * given field, and f=
ill the entries with protocol ID and offset information.
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  523   */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  524  static enum ice_status
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  525  ice_flow_xtract_fld(s=
truct ice_hw *hw, struct ice_flow_prof_params *params,
b199dddbd39953 Qi Zhang              2021-03-09  526  		    u8 seg, enum ic=
e_flow_field fld, u64 match)
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  527  {
b199dddbd39953 Qi Zhang              2021-03-09  528  	enum ice_flow_field =
sib =3D ICE_FLOW_FIELD_IDX_MAX;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  529  	enum ice_prot_id pro=
t_id =3D ICE_PROT_ID_INVAL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  530  	u8 fv_words =3D hw->=
blk[params->blk].es.fvw;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  531  	struct ice_flow_fld_=
info *flds;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  532  	u16 cnt, ese_bits, i;
b199dddbd39953 Qi Zhang              2021-03-09  533  	u16 sib_mask =3D 0;
b199dddbd39953 Qi Zhang              2021-03-09  534  	u16 mask;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  535  	u16 off;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  536  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  537  	flds =3D params->pro=
f->segs[seg].fields;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  538  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  539  	switch (fld) {
390bd141808d50 Qi Zhang              2021-03-09  540  	case ICE_FLOW_FIELD_=
IDX_ETH_DA:
390bd141808d50 Qi Zhang              2021-03-09  541  	case ICE_FLOW_FIELD_=
IDX_ETH_SA:
390bd141808d50 Qi Zhang              2021-03-09  542  	case ICE_FLOW_FIELD_=
IDX_S_VLAN:
390bd141808d50 Qi Zhang              2021-03-09  543  	case ICE_FLOW_FIELD_=
IDX_C_VLAN:
390bd141808d50 Qi Zhang              2021-03-09  544  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_MAC_OF_OR_S : ICE_PROT_MAC_IL;
390bd141808d50 Qi Zhang              2021-03-09  545  		break;
390bd141808d50 Qi Zhang              2021-03-09  546  	case ICE_FLOW_FIELD_=
IDX_ETH_TYPE:
390bd141808d50 Qi Zhang              2021-03-09  547  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_ETYPE_OL : ICE_PROT_ETYPE_IL;
390bd141808d50 Qi Zhang              2021-03-09  548  		break;
b199dddbd39953 Qi Zhang              2021-03-09  549  	case ICE_FLOW_FIELD_=
IDX_IPV4_DSCP:
b199dddbd39953 Qi Zhang              2021-03-09  550  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV4_OF_OR_S : ICE_PROT_IPV4_IL;
b199dddbd39953 Qi Zhang              2021-03-09  551  		break;
b199dddbd39953 Qi Zhang              2021-03-09  552  	case ICE_FLOW_FIELD_=
IDX_IPV6_DSCP:
b199dddbd39953 Qi Zhang              2021-03-09  553  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV6_OF_OR_S : ICE_PROT_IPV6_IL;
b199dddbd39953 Qi Zhang              2021-03-09  554  		break;
b199dddbd39953 Qi Zhang              2021-03-09  555  	case ICE_FLOW_FIELD_=
IDX_IPV4_TTL:
b199dddbd39953 Qi Zhang              2021-03-09  556  	case ICE_FLOW_FIELD_=
IDX_IPV4_PROT:
b199dddbd39953 Qi Zhang              2021-03-09  557  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV4_OF_OR_S : ICE_PROT_IPV4_IL;
b199dddbd39953 Qi Zhang              2021-03-09  558  =

b199dddbd39953 Qi Zhang              2021-03-09  559  		/* TTL and PROT sha=
re the same extraction seq. entry.
b199dddbd39953 Qi Zhang              2021-03-09  560  		 * Each is consider=
ed a sibling to the other in terms of sharing
b199dddbd39953 Qi Zhang              2021-03-09  561  		 * the same extract=
ion sequence entry.
b199dddbd39953 Qi Zhang              2021-03-09  562  		 */
b199dddbd39953 Qi Zhang              2021-03-09  563  		if (fld =3D=3D ICE_=
FLOW_FIELD_IDX_IPV4_TTL)
b199dddbd39953 Qi Zhang              2021-03-09  564  			sib =3D ICE_FLOW_F=
IELD_IDX_IPV4_PROT;
b199dddbd39953 Qi Zhang              2021-03-09  565  		else if (fld =3D=3D=
 ICE_FLOW_FIELD_IDX_IPV4_PROT)
b199dddbd39953 Qi Zhang              2021-03-09  566  			sib =3D ICE_FLOW_F=
IELD_IDX_IPV4_TTL;
b199dddbd39953 Qi Zhang              2021-03-09  567  =

b199dddbd39953 Qi Zhang              2021-03-09  568  		/* If the sibling f=
ield is also included, that field's
b199dddbd39953 Qi Zhang              2021-03-09  569  		 * mask needs to be=
 included.
b199dddbd39953 Qi Zhang              2021-03-09  570  		 */
b199dddbd39953 Qi Zhang              2021-03-09  571  		if (match & BIT(sib=
))
b199dddbd39953 Qi Zhang              2021-03-09  572  			sib_mask =3D ice_f=
lds_info[sib].mask;
b199dddbd39953 Qi Zhang              2021-03-09  573  		break;
b199dddbd39953 Qi Zhang              2021-03-09  574  	case ICE_FLOW_FIELD_=
IDX_IPV6_TTL:
b199dddbd39953 Qi Zhang              2021-03-09  575  	case ICE_FLOW_FIELD_=
IDX_IPV6_PROT:
b199dddbd39953 Qi Zhang              2021-03-09  576  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV6_OF_OR_S : ICE_PROT_IPV6_IL;
b199dddbd39953 Qi Zhang              2021-03-09  577  =

b199dddbd39953 Qi Zhang              2021-03-09  578  		/* TTL and PROT sha=
re the same extraction seq. entry.
b199dddbd39953 Qi Zhang              2021-03-09  579  		 * Each is consider=
ed a sibling to the other in terms of sharing
b199dddbd39953 Qi Zhang              2021-03-09  580  		 * the same extract=
ion sequence entry.
b199dddbd39953 Qi Zhang              2021-03-09  581  		 */
b199dddbd39953 Qi Zhang              2021-03-09  582  		if (fld =3D=3D ICE_=
FLOW_FIELD_IDX_IPV6_TTL)
b199dddbd39953 Qi Zhang              2021-03-09  583  			sib =3D ICE_FLOW_F=
IELD_IDX_IPV6_PROT;
b199dddbd39953 Qi Zhang              2021-03-09  584  		else if (fld =3D=3D=
 ICE_FLOW_FIELD_IDX_IPV6_PROT)
b199dddbd39953 Qi Zhang              2021-03-09  585  			sib =3D ICE_FLOW_F=
IELD_IDX_IPV6_TTL;
b199dddbd39953 Qi Zhang              2021-03-09  586  =

b199dddbd39953 Qi Zhang              2021-03-09  587  		/* If the sibling f=
ield is also included, that field's
b199dddbd39953 Qi Zhang              2021-03-09  588  		 * mask needs to be=
 included.
b199dddbd39953 Qi Zhang              2021-03-09  589  		 */
b199dddbd39953 Qi Zhang              2021-03-09  590  		if (match & BIT(sib=
))
b199dddbd39953 Qi Zhang              2021-03-09  591  			sib_mask =3D ice_f=
lds_info[sib].mask;
b199dddbd39953 Qi Zhang              2021-03-09  592  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  593  	case ICE_FLOW_FIELD_=
IDX_IPV4_SA:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  594  	case ICE_FLOW_FIELD_=
IDX_IPV4_DA:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  595  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV4_OF_OR_S : ICE_PROT_IPV4_IL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  596  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  597  	case ICE_FLOW_FIELD_=
IDX_IPV6_SA:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  598  	case ICE_FLOW_FIELD_=
IDX_IPV6_DA:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  599  		prot_id =3D seg =3D=
=3D 0 ? ICE_PROT_IPV6_OF_OR_S : ICE_PROT_IPV6_IL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  600  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  601  	case ICE_FLOW_FIELD_=
IDX_TCP_SRC_PORT:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  602  	case ICE_FLOW_FIELD_=
IDX_TCP_DST_PORT:
390bd141808d50 Qi Zhang              2021-03-09  603  	case ICE_FLOW_FIELD_=
IDX_TCP_FLAGS:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  604  		prot_id =3D ICE_PRO=
T_TCP_IL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  605  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  606  	case ICE_FLOW_FIELD_=
IDX_UDP_SRC_PORT:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  607  	case ICE_FLOW_FIELD_=
IDX_UDP_DST_PORT:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  608  		prot_id =3D ICE_PRO=
T_UDP_IL_OR_S;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  609  		break;
1c01c8c6c969a9 Md Fahad Iqbal Polash 2020-01-17  610  	case ICE_FLOW_FIELD_=
IDX_SCTP_SRC_PORT:
1c01c8c6c969a9 Md Fahad Iqbal Polash 2020-01-17  611  	case ICE_FLOW_FIELD_=
IDX_SCTP_DST_PORT:
1c01c8c6c969a9 Md Fahad Iqbal Polash 2020-01-17  612  		prot_id =3D ICE_PRO=
T_SCTP_IL;
1c01c8c6c969a9 Md Fahad Iqbal Polash 2020-01-17  613  		break;
390bd141808d50 Qi Zhang              2021-03-09  614  	case ICE_FLOW_FIELD_=
IDX_ARP_SIP:
390bd141808d50 Qi Zhang              2021-03-09  615  	case ICE_FLOW_FIELD_=
IDX_ARP_DIP:
390bd141808d50 Qi Zhang              2021-03-09  616  	case ICE_FLOW_FIELD_=
IDX_ARP_SHA:
390bd141808d50 Qi Zhang              2021-03-09  617  	case ICE_FLOW_FIELD_=
IDX_ARP_DHA:
390bd141808d50 Qi Zhang              2021-03-09  618  	case ICE_FLOW_FIELD_=
IDX_ARP_OP:
390bd141808d50 Qi Zhang              2021-03-09  619  		prot_id =3D ICE_PRO=
T_ARP_OF;
390bd141808d50 Qi Zhang              2021-03-09  620  		break;
390bd141808d50 Qi Zhang              2021-03-09  621  	case ICE_FLOW_FIELD_=
IDX_ICMP_TYPE:
390bd141808d50 Qi Zhang              2021-03-09  622  	case ICE_FLOW_FIELD_=
IDX_ICMP_CODE:
390bd141808d50 Qi Zhang              2021-03-09  623  		/* ICMP type and co=
de share the same extraction seq. entry */
390bd141808d50 Qi Zhang              2021-03-09  624  		prot_id =3D (params=
->prof->segs[seg].hdrs & ICE_FLOW_SEG_HDR_IPV4) ?
390bd141808d50 Qi Zhang              2021-03-09  625  				ICE_PROT_ICMP_IL =
: ICE_PROT_ICMPV6_IL;
b199dddbd39953 Qi Zhang              2021-03-09  626  		sib =3D fld =3D=3D =
ICE_FLOW_FIELD_IDX_ICMP_TYPE ?
b199dddbd39953 Qi Zhang              2021-03-09  627  			ICE_FLOW_FIELD_IDX=
_ICMP_CODE :
b199dddbd39953 Qi Zhang              2021-03-09  628  			ICE_FLOW_FIELD_IDX=
_ICMP_TYPE;
390bd141808d50 Qi Zhang              2021-03-09  629  		break;
a4e82a81f57387 Tony Nguyen           2020-05-06  630  	case ICE_FLOW_FIELD_=
IDX_GRE_KEYID:
a4e82a81f57387 Tony Nguyen           2020-05-06  631  		prot_id =3D ICE_PRO=
T_GRE_OF;
a4e82a81f57387 Tony Nguyen           2020-05-06  632  		break;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  633  	default:
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  634  		return ICE_ERR_NOT_=
IMPL;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  635  	}
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  636  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  637  	/* Each extraction s=
equence entry is a word in size, and extracts a
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  638  	 * word-aligned offs=
et from a protocol header.
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  639  	 */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  640  	ese_bits =3D ICE_FLO=
W_FV_EXTRACT_SZ * BITS_PER_BYTE;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  641  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  642  	flds[fld].xtrct.prot=
_id =3D prot_id;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  643  	flds[fld].xtrct.off =
=3D (ice_flds_info[fld].off / ese_bits) *
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  644  		ICE_FLOW_FV_EXTRACT=
_SZ;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  645  	flds[fld].xtrct.disp=
 =3D (u8)(ice_flds_info[fld].off % ese_bits);
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  646  	flds[fld].xtrct.idx =
=3D params->es_cnt;
b199dddbd39953 Qi Zhang              2021-03-09  647  	flds[fld].xtrct.mask=
 =3D ice_flds_info[fld].mask;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  648  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  649  	/* Adjust the next f=
ield-entry index after accommodating the number of
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  650  	 * entries this fiel=
d consumes
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  651  	 */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  652  	cnt =3D DIV_ROUND_UP=
(flds[fld].xtrct.disp + ice_flds_info[fld].size,
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  653  			   ese_bits);
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  654  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  655  	/* Fill in the extra=
ction sequence entries needed for this field */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  656  	off =3D flds[fld].xt=
rct.off;
b199dddbd39953 Qi Zhang              2021-03-09  657  	mask =3D flds[fld].x=
trct.mask;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  658  	for (i =3D 0; i < cn=
t; i++) {
b199dddbd39953 Qi Zhang              2021-03-09  659  		/* Only consume an =
extraction sequence entry if there is no
b199dddbd39953 Qi Zhang              2021-03-09  660  		 * sibling field as=
sociated with this field or the sibling entry
b199dddbd39953 Qi Zhang              2021-03-09  661  		 * already extracts=
 the word shared with this field.
b199dddbd39953 Qi Zhang              2021-03-09  662  		 */
b199dddbd39953 Qi Zhang              2021-03-09 @663  		if (sib =3D=3D ICE_=
FLOW_FIELD_IDX_MAX ||
b199dddbd39953 Qi Zhang              2021-03-09  664  		    flds[sib].xtrct=
.prot_id =3D=3D ICE_PROT_ID_INVAL ||
b199dddbd39953 Qi Zhang              2021-03-09  665  		    flds[sib].xtrct=
.off !=3D off) {
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  666  			u8 idx;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  667  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  668  			/* Make sure the n=
umber of extraction sequence required
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  669  			 * does not exceed=
 the block's capability
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  670  			 */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  671  			if (params->es_cnt=
 >=3D fv_words)
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  672  				return ICE_ERR_MA=
X_LIMIT;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  673  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  674  			/* some blocks req=
uire a reversed field vector layout */
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  675  			if (hw->blk[params=
->blk].es.reverse)
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  676  				idx =3D fv_words =
- params->es_cnt - 1;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  677  			else
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  678  				idx =3D params->e=
s_cnt;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  679  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  680  			params->es[idx].pr=
ot_id =3D prot_id;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  681  			params->es[idx].of=
f =3D off;
b199dddbd39953 Qi Zhang              2021-03-09  682  			params->mask[idx] =
=3D mask | sib_mask;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  683  			params->es_cnt++;
b199dddbd39953 Qi Zhang              2021-03-09  684  		}
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  685  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  686  		off +=3D ICE_FLOW_F=
V_EXTRACT_SZ;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  687  	}
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  688  =

31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  689  	return 0;
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  690  }
31ad4e4ee1e4e2 Tony Nguyen           2020-01-17  691  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0420576822759142007==--

