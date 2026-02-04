Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56F1DDC07
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 05:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770183312; cv=none; b=coimEv6HxdBRBA4/2+E9DqX0WAeIdsTZXPOtL1a9fJ01/Dxu2dCeonOyAemnmn6UANYbrUiNbBNr3QwvQe/IBlDrcw/T2SwDLGfjdz3Ux5h7BKcCqFMvPGs0eb71MRoi6twGkf63N/cD4j6FmDi42nhRQtchOxgI9lIAWeE4Kpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770183312; c=relaxed/simple;
	bh=PE7EuKNXvK0OHJuZWbG5D/4XmYLIGY4pES/IVbEwG04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z8vZuNGdMUeGx2SyfAIXzhTlsnOfWDkUU0/KHXdhPtkXQzZbjldn1N3+QHhbzFkFvGA6QS40pLrNdSJ0jgxEs2+RPXXIBsFjd8PrFZcC+jvziU3sFMVAUPx12zNcEpPorXiDLxassEQmM1i0Z4SmthCxbVHSsa+/CMNzSxZEuPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzZS7keE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzZS7keE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770183313; x=1801719313;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PE7EuKNXvK0OHJuZWbG5D/4XmYLIGY4pES/IVbEwG04=;
  b=UzZS7keEi+NTf4nYSGMUH/e/y62Xnbu9KcOKcx4aRIoWgcA0zaje6ceM
   fZSerS7iI5UcwWXTKv4uDvOYKBntZ2Vl+PseFhFhuI7CGmS9V56x53Giy
   xxZRSQZfk2CGWGd1nwhjtIlh/yVDsFqUqUTquZISvypaC4+W0OdJeUxHj
   /+dZqrRhtpMPnPdMl4PW8nJ2SMOOzD2Y4jBZNSqDUGF+lgmMH2gRCVi/r
   hyzZBKgFwjnSBCdPzAnaIVXNHfaMxDMODzEZiYyfQmhh0CfQAuWO3GrCC
   r8nCf21uukHz7LtCMfEm+kx3LSPPxZZDN/KbYMiWsvbWNtV6oH0AEfvmT
   g==;
X-CSE-ConnectionGUID: S+5Drnm4QSKW3uiBsNWFYQ==
X-CSE-MsgGUID: rZpzolUSSF6C0i3oJqYcoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82475008"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82475008"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 21:35:13 -0800
X-CSE-ConnectionGUID: FfkSuxW1SyOSMHxRdBF7Cw==
X-CSE-MsgGUID: +qFOc68NQZOT5f9gBOTz/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209448077"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2026 21:35:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnVXc-00000000hTe-1DCz;
	Wed, 04 Feb 2026 05:35:04 +0000
Date: Wed, 04 Feb 2026 13:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11349/11582] net/ipv4/tcp_output.c:754
 tcp_options_write() error: we previously assumed 'tp' could be null (see line
 722)
Message-ID: <202602041310.ZBuXDXC5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Chia-Yu Chang" <chia-yu.chang@nokia-bell-labs.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5c009020744fe129e4728e71c44a6c7816c9105e
commit: 1247fb19cafee6f9fa350ae378e4e1e9965cc253 [11349/11582] tcp: accecn:=
 detect loss ACK w/ AccECN option and add TCP_ACCECN_OPTION_PERSIST
:::::: branch date: 10 hours ago
:::::: commit date: 15 hours ago
config: s390-randconfig-r071-20260204 (https://download.01.org/0day-ci/arch=
ive/20260204/202602041310.ZBuXDXC5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602041310.ZBuXDXC5-lkp@intel.com/

smatch warnings:
net/ipv4/tcp_output.c:754 tcp_options_write() error: we previously assumed =
'tp' could be null (see line 722)

vim +/tp +754 net/ipv4/tcp_output.c

b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  620 =20
7425627b2b2cd6 Nathan Chancellor     2023-11-06  621  /* Write previously c=
omputed TCP options to the packet.
7425627b2b2cd6 Nathan Chancellor     2023-11-06  622   *
7425627b2b2cd6 Nathan Chancellor     2023-11-06  623   * Beware: Something =
in the Internet is very sensitive to the ordering of
7425627b2b2cd6 Nathan Chancellor     2023-11-06  624   * TCP options, we le=
arned this through the hard way, so be careful here.
7425627b2b2cd6 Nathan Chancellor     2023-11-06  625   * Luckily we can at =
least blame others for their non-compliance but from
7425627b2b2cd6 Nathan Chancellor     2023-11-06  626   * inter-operability =
perspective it seems that we're somewhat stuck with
7425627b2b2cd6 Nathan Chancellor     2023-11-06  627   * the ordering which=
 we have been using if we want to keep working with
7425627b2b2cd6 Nathan Chancellor     2023-11-06  628   * those broken thing=
s (not that it currently hurts anybody as there isn't
7425627b2b2cd6 Nathan Chancellor     2023-11-06  629   * particular reason =
why the ordering would need to be changed).
7425627b2b2cd6 Nathan Chancellor     2023-11-06  630   *
7425627b2b2cd6 Nathan Chancellor     2023-11-06  631   * At least SACK_PERM=
 as the first option is known to lead to a disaster
7425627b2b2cd6 Nathan Chancellor     2023-11-06  632   * (but it may well b=
e that other scenarios fail similarly).
7425627b2b2cd6 Nathan Chancellor     2023-11-06  633   */
7425627b2b2cd6 Nathan Chancellor     2023-11-06  634  static void tcp_optio=
ns_write(struct tcphdr *th, struct tcp_sock *tp,
7425627b2b2cd6 Nathan Chancellor     2023-11-06  635  			      const struct=
 tcp_request_sock *tcprsk,
7425627b2b2cd6 Nathan Chancellor     2023-11-06  636  			      struct tcp_o=
ut_options *opts,
7425627b2b2cd6 Nathan Chancellor     2023-11-06  637  			      struct tcp_k=
ey *key)
7425627b2b2cd6 Nathan Chancellor     2023-11-06  638  {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  639  	u8 leftover_hig=
hbyte =3D TCPOPT_NOP; /* replace 1st NOP if avail */
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  640  	u8 leftover_low=
byte =3D TCPOPT_NOP;  /* replace 2nd NOP in succession */
7425627b2b2cd6 Nathan Chancellor     2023-11-06  641  	__be32 *ptr =3D (__b=
e32 *)(th + 1);
7425627b2b2cd6 Nathan Chancellor     2023-11-06  642  	u16 options =3D opts=
->options;	/* mungable copy */
7425627b2b2cd6 Nathan Chancellor     2023-11-06  643 =20
7425627b2b2cd6 Nathan Chancellor     2023-11-06  644  	if (tcp_key_is_md5(k=
ey)) {
7425627b2b2cd6 Nathan Chancellor     2023-11-06  645  		*ptr++ =3D htonl((T=
CPOPT_NOP << 24) | (TCPOPT_NOP << 16) |
7425627b2b2cd6 Nathan Chancellor     2023-11-06  646  			       (TCPOPT_MD5=
SIG << 8) | TCPOLEN_MD5SIG);
7425627b2b2cd6 Nathan Chancellor     2023-11-06  647  		/* overload cookie =
hash location */
7425627b2b2cd6 Nathan Chancellor     2023-11-06  648  		opts->hash_location=
 =3D (__u8 *)ptr;
7425627b2b2cd6 Nathan Chancellor     2023-11-06  649  		ptr +=3D 4;
7425627b2b2cd6 Nathan Chancellor     2023-11-06  650  	} else if (tcp_key_i=
s_ao(key)) {
7425627b2b2cd6 Nathan Chancellor     2023-11-06  651  		ptr =3D process_tcp=
_ao_options(tp, tcprsk, opts, key, ptr);
33ad798c924b4a Adam Langley          2008-07-19  652  	}
fd6149d332973b Ilpo J=C3=A4rvinen         2008-10-23  653  	if (unlikely(op=
ts->mss)) {
fd6149d332973b Ilpo J=C3=A4rvinen         2008-10-23  654  		*ptr++ =3D hto=
nl((TCPOPT_MSS << 24) |
fd6149d332973b Ilpo J=C3=A4rvinen         2008-10-23  655  			       (TCPOL=
EN_MSS << 16) |
fd6149d332973b Ilpo J=C3=A4rvinen         2008-10-23  656  			       opts->=
mss);
fd6149d332973b Ilpo J=C3=A4rvinen         2008-10-23  657  	}
fd6149d332973b Ilpo J=C3=A4rvinen         2008-10-23  658 =20
bd0388ae770750 William Allen Simpson 2009-12-02  659  	if (likely(OPTION_TS=
 & options)) {
bd0388ae770750 William Allen Simpson 2009-12-02  660  		if (unlikely(OPTION=
_SACK_ADVERTISE & options)) {
33ad798c924b4a Adam Langley          2008-07-19  661  			*ptr++ =3D htonl((=
TCPOPT_SACK_PERM << 24) |
33ad798c924b4a Adam Langley          2008-07-19  662  				       (TCPOLEN_S=
ACK_PERM << 16) |
33ad798c924b4a Adam Langley          2008-07-19  663  				       (TCPOPT_TI=
MESTAMP << 8) |
33ad798c924b4a Adam Langley          2008-07-19  664  				       TCPOLEN_TI=
MESTAMP);
bd0388ae770750 William Allen Simpson 2009-12-02  665  			options &=3D ~OPTI=
ON_SACK_ADVERTISE;
33ad798c924b4a Adam Langley          2008-07-19  666  		} else {
496c98dff8e353 YOSHIFUJI Hideaki     2006-10-10  667  			*ptr++ =3D htonl((=
TCPOPT_NOP << 24) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  668  				       (TCPOPT_NO=
P << 16) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  669  				       (TCPOPT_TI=
MESTAMP << 8) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  670  				       TCPOLEN_TI=
MESTAMP);
40efc6fa179f44 Stephen Hemminger     2006-01-03  671  		}
33ad798c924b4a Adam Langley          2008-07-19  672  		*ptr++ =3D htonl(op=
ts->tsval);
33ad798c924b4a Adam Langley          2008-07-19  673  		*ptr++ =3D htonl(op=
ts->tsecr);
33ad798c924b4a Adam Langley          2008-07-19  674  	}
33ad798c924b4a Adam Langley          2008-07-19  675 =20
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  676  	if (OPTION_ACCE=
CN & options) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  677  		const u32 *ecn=
_bytes =3D opts->use_synack_ecn_bytes ?
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  678  				       synac=
k_ecn_bytes :
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  679  				       tp->r=
eceived_ecn_bytes;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  680  		const u8 ect0_=
idx =3D INET_ECN_ECT_0 - 1;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  681  		const u8 ect1_=
idx =3D INET_ECN_ECT_1 - 1;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  682  		const u8 ce_id=
x =3D INET_ECN_CE - 1;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  683  		u32 e0b;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  684  		u32 e1b;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  685  		u32 ceb;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  686  		u8 len;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  687 =20
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  688  		e0b =3D ecn_by=
tes[ect0_idx] + TCP_ACCECN_E0B_INIT_OFFSET;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  689  		e1b =3D ecn_by=
tes[ect1_idx] + TCP_ACCECN_E1B_INIT_OFFSET;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  690  		ceb =3D ecn_by=
tes[ce_idx] + TCP_ACCECN_CEB_INIT_OFFSET;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  691  		len =3D TCPOLE=
N_ACCECN_BASE +
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  692  		      opts->nu=
m_accecn_fields * TCPOLEN_ACCECN_PERFIELD;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  693 =20
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  694  		if (opts->num_=
accecn_fields =3D=3D 2) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  695  			*ptr++ =3D ht=
onl((TCPOPT_ACCECN1 << 24) | (len << 16) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  696  				       ((e1b=
 >> 8) & 0xffff));
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  697  			*ptr++ =3D ht=
onl(((e1b & 0xff) << 24) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  698  				       (ceb =
& 0xffffff));
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  699  		} else if (opt=
s->num_accecn_fields =3D=3D 1) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  700  			*ptr++ =3D ht=
onl((TCPOPT_ACCECN1 << 24) | (len << 16) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  701  				       ((e1b=
 >> 8) & 0xffff));
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  702  			leftover_high=
byte =3D e1b & 0xff;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  703  			leftover_lowb=
yte =3D TCPOPT_NOP;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  704  		} else if (opt=
s->num_accecn_fields =3D=3D 0) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  705  			leftover_high=
byte =3D TCPOPT_ACCECN1;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  706  			leftover_lowb=
yte =3D len;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  707  		} else if (opt=
s->num_accecn_fields =3D=3D 3) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  708  			*ptr++ =3D ht=
onl((TCPOPT_ACCECN1 << 24) | (len << 16) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  709  				       ((e1b=
 >> 8) & 0xffff));
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  710  			*ptr++ =3D ht=
onl(((e1b & 0xff) << 24) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  711  				       (ceb =
& 0xffffff));
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  712  			*ptr++ =3D ht=
onl(((e0b & 0xffffff) << 8) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  713  				       TCPOP=
T_NOP);
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  714  		}
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  715  		if (tp) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  716  			tp->accecn_mi=
nlen =3D 0;
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  717  			tp->accecn_opt_tst=
amp =3D tp->tcp_mstamp;
1247fb19cafee6 Chia-Yu Chang         2026-01-31  718  			tp->accecn_opt_sen=
t_w_dsack =3D tp->rx_opt.dsack;
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  719  			if (tp->accecn_opt=
_demand)
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  720  				tp->accecn_opt_de=
mand--;
aa55a7dde7ec50 Chia-Yu Chang         2025-09-16  721  		}
1247fb19cafee6 Chia-Yu Chang         2026-01-31 @722  	} else if (tp) {
1247fb19cafee6 Chia-Yu Chang         2026-01-31  723  		tp->accecn_opt_sent=
_w_dsack =3D 0;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  724  	}
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  725 =20
bd0388ae770750 William Allen Simpson 2009-12-02  726  	if (unlikely(OPTION_=
SACK_ADVERTISE & options)) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  727  		*ptr++ =3D hto=
nl((leftover_highbyte << 24) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  728  			       (lefto=
ver_lowbyte << 16) |
33ad798c924b4a Adam Langley          2008-07-19  729  			       (TCPOPT_SAC=
K_PERM << 8) |
33ad798c924b4a Adam Langley          2008-07-19  730  			       TCPOLEN_SAC=
K_PERM);
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  731  		leftover_highb=
yte =3D TCPOPT_NOP;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  732  		leftover_lowby=
te =3D TCPOPT_NOP;
33ad798c924b4a Adam Langley          2008-07-19  733  	}
33ad798c924b4a Adam Langley          2008-07-19  734 =20
bd0388ae770750 William Allen Simpson 2009-12-02  735  	if (unlikely(OPTION_=
WSCALE & options)) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  736  		u8 highbyte =
=3D TCPOPT_NOP;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  737 =20
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  738  		/* Do not spli=
t the leftover 2-byte to fit into a single
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  739  		 * NOP, i.e., =
replace this NOP only when 1 byte is leftover
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  740  		 * within left=
over_highbyte.
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  741  		 */
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  742  		if (unlikely(l=
eftover_highbyte !=3D TCPOPT_NOP &&
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  743  			     leftover=
_lowbyte =3D=3D TCPOPT_NOP)) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  744  			highbyte =3D =
leftover_highbyte;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  745  			leftover_high=
byte =3D TCPOPT_NOP;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  746  		}
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  747  		*ptr++ =3D hto=
nl((highbyte << 24) |
33ad798c924b4a Adam Langley          2008-07-19  748  			       (TCPOPT_WIN=
DOW << 16) |
33ad798c924b4a Adam Langley          2008-07-19  749  			       (TCPOLEN_WI=
NDOW << 8) |
33ad798c924b4a Adam Langley          2008-07-19  750  			       opts->ws);
33ad798c924b4a Adam Langley          2008-07-19  751  	}
33ad798c924b4a Adam Langley          2008-07-19  752 =20
33ad798c924b4a Adam Langley          2008-07-19  753  	if (unlikely(opts->n=
um_sack_blocks)) {
33ad798c924b4a Adam Langley          2008-07-19 @754  		struct tcp_sack_blo=
ck *sp =3D tp->rx_opt.dsack ?
33ad798c924b4a Adam Langley          2008-07-19  755  			tp->duplicate_sack=
 : tp->selective_acks;
40efc6fa179f44 Stephen Hemminger     2006-01-03  756  		int this_sack;
40efc6fa179f44 Stephen Hemminger     2006-01-03  757 =20
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  758  		*ptr++ =3D hto=
nl((leftover_highbyte << 24) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  759  			       (lefto=
ver_lowbyte << 16) |
40efc6fa179f44 Stephen Hemminger     2006-01-03  760  			       (TCPOPT_SAC=
K <<  8) |
33ad798c924b4a Adam Langley          2008-07-19  761  			       (TCPOLEN_SA=
CK_BASE + (opts->num_sack_blocks *
40efc6fa179f44 Stephen Hemminger     2006-01-03  762  						     TCPOLEN_SA=
CK_PERBLOCK)));
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  763  		leftover_highb=
yte =3D TCPOPT_NOP;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  764  		leftover_lowby=
te =3D TCPOPT_NOP;
2de979bd7da9c8 Stephen Hemminger     2007-03-08  765 =20
33ad798c924b4a Adam Langley          2008-07-19  766  		for (this_sack =3D =
0; this_sack < opts->num_sack_blocks;
33ad798c924b4a Adam Langley          2008-07-19  767  		     ++this_sack) {
40efc6fa179f44 Stephen Hemminger     2006-01-03  768  			*ptr++ =3D htonl(s=
p[this_sack].start_seq);
40efc6fa179f44 Stephen Hemminger     2006-01-03  769  			*ptr++ =3D htonl(s=
p[this_sack].end_seq);
40efc6fa179f44 Stephen Hemminger     2006-01-03  770  		}
2de979bd7da9c8 Stephen Hemminger     2007-03-08  771 =20
40efc6fa179f44 Stephen Hemminger     2006-01-03  772  		tp->rx_opt.dsack =
=3D 0;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  773  	} else if (unli=
kely(leftover_highbyte !=3D TCPOPT_NOP ||
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  774  			    leftover_=
lowbyte !=3D TCPOPT_NOP)) {
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  775  		*ptr++ =3D hto=
nl((leftover_highbyte << 24) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  776  			       (lefto=
ver_lowbyte << 16) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  777  			       (TCPOP=
T_NOP << 8) |
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  778  			       TCPOPT=
_NOP);
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  779  		leftover_highb=
yte =3D TCPOPT_NOP;
b5e74132dfbe60 Ilpo J=C3=A4rvinen         2025-09-16  780  		leftover_lowby=
te =3D TCPOPT_NOP;
40efc6fa179f44 Stephen Hemminger     2006-01-03  781  	}
2100c8d2d9db23 Yuchung Cheng         2012-07-19  782 =20
2100c8d2d9db23 Yuchung Cheng         2012-07-19  783  	if (unlikely(OPTION_=
FAST_OPEN_COOKIE & options)) {
2100c8d2d9db23 Yuchung Cheng         2012-07-19  784  		struct tcp_fastopen=
_cookie *foc =3D opts->fastopen_cookie;
7f9b838b71eb78 Daniel Lee            2015-04-06  785  		u8 *p =3D (u8 *)ptr;
7f9b838b71eb78 Daniel Lee            2015-04-06  786  		u32 len; /* Fast Op=
en option length */
2100c8d2d9db23 Yuchung Cheng         2012-07-19  787 =20
7f9b838b71eb78 Daniel Lee            2015-04-06  788  		if (foc->exp) {
7f9b838b71eb78 Daniel Lee            2015-04-06  789  			len =3D TCPOLEN_EX=
P_FASTOPEN_BASE + foc->len;
7f9b838b71eb78 Daniel Lee            2015-04-06  790  			*ptr =3D htonl((TC=
POPT_EXP << 24) | (len << 16) |
2100c8d2d9db23 Yuchung Cheng         2012-07-19  791  				     TCPOPT_FASTO=
PEN_MAGIC);
7f9b838b71eb78 Daniel Lee            2015-04-06  792  			p +=3D TCPOLEN_EXP=
_FASTOPEN_BASE;
7f9b838b71eb78 Daniel Lee            2015-04-06  793  		} else {
7f9b838b71eb78 Daniel Lee            2015-04-06  794  			len =3D TCPOLEN_FA=
STOPEN_BASE + foc->len;
7f9b838b71eb78 Daniel Lee            2015-04-06  795  			*p++ =3D TCPOPT_FA=
STOPEN;
7f9b838b71eb78 Daniel Lee            2015-04-06  796  			*p++ =3D len;
7f9b838b71eb78 Daniel Lee            2015-04-06  797  		}
2100c8d2d9db23 Yuchung Cheng         2012-07-19  798 =20
7f9b838b71eb78 Daniel Lee            2015-04-06  799  		memcpy(p, foc->val,=
 foc->len);
7f9b838b71eb78 Daniel Lee            2015-04-06  800  		if ((len & 3) =3D=
=3D 2) {
7f9b838b71eb78 Daniel Lee            2015-04-06  801  			p[foc->len] =3D TC=
POPT_NOP;
7f9b838b71eb78 Daniel Lee            2015-04-06  802  			p[foc->len + 1] =
=3D TCPOPT_NOP;
2100c8d2d9db23 Yuchung Cheng         2012-07-19  803  		}
7f9b838b71eb78 Daniel Lee            2015-04-06  804  		ptr +=3D (len + 3) =
>> 2;
2100c8d2d9db23 Yuchung Cheng         2012-07-19  805  	}
60e2a7780793ba Ursula Braun          2017-10-25  806 =20
60e2a7780793ba Ursula Braun          2017-10-25  807  	smc_options_write(pt=
r, &options);
eda7acddf8080b Peter Krystad         2020-01-21  808 =20
ea66758c1795ce Paolo Abeni           2022-05-04  809  	mptcp_options_write(=
th, ptr, tp, opts);
60e2a7780793ba Ursula Braun          2017-10-25  810  }
60e2a7780793ba Ursula Braun          2017-10-25  811 =20

:::::: The code at line 754 was first introduced by commit
:::::: 33ad798c924b4a1afad3593f2796d465040aadd5 tcp: options clean up

:::::: TO: Adam Langley <agl@imperialviolet.org>
:::::: CC: David S. Miller <davem@davemloft.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
