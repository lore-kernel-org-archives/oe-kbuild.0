Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686032036E9
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691717; cv=none; b=lvKP6Xd8Cx7njoLhTsNECnEugfg+x5j0kp5IOchCsCVnqozFUKRoojzYPNyV9gQbdm7mYWqDnRLpSlzL4SRRN0ZvSm9D6KotolAVNYcIYg5oMjyXO5igw60w/3AAKJhJAA01f2joNxX5IduD7wAfudE7JtC7X9ss/+YlST9Fh/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691717; c=relaxed/simple;
	bh=tOWopi689JvyKvwW6Dcu4VW1ekkfMWrIkT8HMBJNstk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DPH//fgFPTNnHFzFQTNbNDPPuk4HxUPOo1eQeHNLZmLwlHv9pfoUuPX6mv9k5LUMmEGxRcZu+c4JmORWM+OxyNWugPYrH/exvPyIsWcq86qtNFWInSQ8ixk3qUr/b6cf9YRtBhmccI1cVf7xH+Ud+3xCzig3nF0XnCwfSaB6Iow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KY1WK/0W; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KY1WK/0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774691714; x=1806227714;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tOWopi689JvyKvwW6Dcu4VW1ekkfMWrIkT8HMBJNstk=;
  b=KY1WK/0W+A4gcQjujPU03u/boO5vitdfNVIQwyFYcS4SgxRhbnTaDgTu
   JjIVXMFRPbMZ6Wksa+aM/eHKO12+arXsg4QD7Dr/pLmowYhoDTiap77GF
   4nvoAPWXR4mrtb6W1hDqGgPkc1hmRmpdYXvJOwjZITOmTCytdcVxx12N0
   IVlg+Gib8OIZ0mAQ3eUuqwqkke5k50z049oXR6dmMoKzGG2mnuX5TX0gl
   X7BZ+rVp7bvXoPvhq78C/9fkTNQIq7NGvoroQnmw6JXySrfFWpzlvBoFM
   +H/H8qpGz9iG9Jf4RY4P24NfauGhaOjMQeVpGlpgTFzNFmwQW906FPYEa
   g==;
X-CSE-ConnectionGUID: vvS/laVsTKuniBkD0hf1kA==
X-CSE-MsgGUID: 8g/zNuugS6W5h+OWUEsRbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="87141103"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="87141103"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 02:55:13 -0700
X-CSE-ConnectionGUID: iOisemMDSvygg6SyQCvmhA==
X-CSE-MsgGUID: KAJDIFhwRzqpopZtczsfDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="224736666"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2026 02:55:12 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6QNp-00000000BI7-43xV;
	Sat, 28 Mar 2026 09:55:09 +0000
Date: Sat, 28 Mar 2026 17:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 51/525] net/mac80211/debugfs.c:109
 aqm_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603281706.3CSDII39-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_=
iter
head:   a20631c136551e49bcb2cb9c229e2b7c826a6aa6
commit: 9660c1d6968417e54a2a0719f058a7e5e2e53595 [51/525] net: mac80211: co=
nvert to read/write iterators
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r071-20260328 (https://download.01.org/0day-ci/ar=
chive/20260328/202603281706.3CSDII39-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603281706.3CSDII39-lkp@intel.com/

New smatch warnings:
net/mac80211/debugfs.c:109 aqm_write() warn: potential spectre issue 'buf' =
[w]
net/mac80211/debugfs.c:160 airtime_flags_write() warn: potential spectre is=
sue 'buf' [w]
net/mac80211/debugfs.c:240 aql_txq_limit_write() warn: potential spectre is=
sue 'buf' [w]
net/mac80211/debugfs.c:348 force_tx_status_write() warn: potential spectre =
issue 'buf' [w]

Old smatch warnings:
net/mac80211/debugfs.c:250 aql_txq_limit_write() warn: potential spectre is=
sue 'local->aql_txq_limit_low' [r] (local cap)
net/mac80211/debugfs.c:251 aql_txq_limit_write() warn: potential spectre is=
sue 'local->aql_txq_limit_high' [r] (local cap)
net/mac80211/debugfs.c:260 aql_txq_limit_write() warn: possible spectre sec=
ond half.  'q_limit_low_old'
net/mac80211/debugfs.c:261 aql_txq_limit_write() warn: possible spectre sec=
ond half.  'q_limit_high_old'
net/mac80211/debugfs.c:262 aql_txq_limit_write() warn: potential spectre is=
sue 'sta->airtime' [w] (local cap)

vim +/buf +109 net/mac80211/debugfs.c

9399b86c0e9a05 Michal Kazior          2016-05-19   95 =20
9660c1d6968417 Jens Axboe             2024-04-10   96  static ssize_t aqm_w=
rite(struct kiocb *iocb, struct iov_iter *from)
9399b86c0e9a05 Michal Kazior          2016-05-19   97  {
9660c1d6968417 Jens Axboe             2024-04-10   98  	struct ieee80211_lo=
cal *local =3D iocb->ki_filp->private_data;
9660c1d6968417 Jens Axboe             2024-04-10   99  	size_t count =3D io=
v_iter_count(from);
9399b86c0e9a05 Michal Kazior          2016-05-19  100  	char buf[100];
9399b86c0e9a05 Michal Kazior          2016-05-19  101 =20
6020d534fa012b Shayne Chen            2021-01-12  102  	if (count >=3D size=
of(buf))
9399b86c0e9a05 Michal Kazior          2016-05-19  103  		return -EINVAL;
9399b86c0e9a05 Michal Kazior          2016-05-19  104 =20
9660c1d6968417 Jens Axboe             2024-04-10  105  	if (!copy_from_iter=
_full(buf, count, from))
9399b86c0e9a05 Michal Kazior          2016-05-19  106  		return -EFAULT;
9399b86c0e9a05 Michal Kazior          2016-05-19  107 =20
6020d534fa012b Shayne Chen            2021-01-12  108  	if (count && buf[co=
unt - 1] =3D=3D '\n')
6020d534fa012b Shayne Chen            2021-01-12 @109  		buf[count - 1] =3D =
'\0';
6020d534fa012b Shayne Chen            2021-01-12  110  	else
6020d534fa012b Shayne Chen            2021-01-12  111  		buf[count] =3D '\0=
';
9399b86c0e9a05 Michal Kazior          2016-05-19  112 =20
9399b86c0e9a05 Michal Kazior          2016-05-19  113  	if (sscanf(buf, "fq=
_limit %u", &local->fq.limit) =3D=3D 1)
9399b86c0e9a05 Michal Kazior          2016-05-19  114  		return count;
2a4e675d887bb3 Toke H=C3=B8iland-J=C3=B8rgensen 2016-09-23  115  	else if (=
sscanf(buf, "fq_memory_limit %u", &local->fq.memory_limit) =3D=3D 1)
2a4e675d887bb3 Toke H=C3=B8iland-J=C3=B8rgensen 2016-09-23  116  		return c=
ount;
9399b86c0e9a05 Michal Kazior          2016-05-19  117  	else if (sscanf(buf=
, "fq_quantum %u", &local->fq.quantum) =3D=3D 1)
9399b86c0e9a05 Michal Kazior          2016-05-19  118  		return count;
9399b86c0e9a05 Michal Kazior          2016-05-19  119 =20
9399b86c0e9a05 Michal Kazior          2016-05-19  120  	return -EINVAL;
9399b86c0e9a05 Michal Kazior          2016-05-19  121  }
9399b86c0e9a05 Michal Kazior          2016-05-19  122 =20
31cb94f71c1ba1 Johannes Berg          2024-10-22  123  static const struct =
debugfs_short_fops aqm_ops =3D {
9660c1d6968417 Jens Axboe             2024-04-10  124  	.write_iter =3D aqm=
_write,
9660c1d6968417 Jens Axboe             2024-04-10  125  	.read_iter =3D aqm_=
read,
9399b86c0e9a05 Michal Kazior          2016-05-19  126  	.llseek =3D default=
_llseek,
9399b86c0e9a05 Michal Kazior          2016-05-19  127  };
9399b86c0e9a05 Michal Kazior          2016-05-19  128 =20
9660c1d6968417 Jens Axboe             2024-04-10  129  static ssize_t airti=
me_flags_read(struct kiocb *iocb, struct iov_iter *to)
e322c07f837116 Lorenzo Bianconi       2019-11-27  130  {
9660c1d6968417 Jens Axboe             2024-04-10  131  	struct ieee80211_lo=
cal *local =3D iocb->ki_filp->private_data;
e322c07f837116 Lorenzo Bianconi       2019-11-27  132  	char buf[128] =3D {=
}, *pos, *end;
e322c07f837116 Lorenzo Bianconi       2019-11-27  133 =20
e322c07f837116 Lorenzo Bianconi       2019-11-27  134  	pos =3D buf;
e322c07f837116 Lorenzo Bianconi       2019-11-27  135  	end =3D pos + sizeo=
f(buf) - 1;
e322c07f837116 Lorenzo Bianconi       2019-11-27  136 =20
e322c07f837116 Lorenzo Bianconi       2019-11-27  137  	if (local->airtime_=
flags & AIRTIME_USE_TX)
e322c07f837116 Lorenzo Bianconi       2019-11-27  138  		pos +=3D scnprintf=
(pos, end - pos, "AIRTIME_TX\t(%lx)\n",
e322c07f837116 Lorenzo Bianconi       2019-11-27  139  				 AIRTIME_USE_TX);
e322c07f837116 Lorenzo Bianconi       2019-11-27  140  	if (local->airtime_=
flags & AIRTIME_USE_RX)
e322c07f837116 Lorenzo Bianconi       2019-11-27  141  		pos +=3D scnprintf=
(pos, end - pos, "AIRTIME_RX\t(%lx)\n",
e322c07f837116 Lorenzo Bianconi       2019-11-27  142  				 AIRTIME_USE_RX);
e322c07f837116 Lorenzo Bianconi       2019-11-27  143 =20
9660c1d6968417 Jens Axboe             2024-04-10  144  	return simple_copy_=
to_iter(buf, &iocb->ki_pos, strlen(buf), to);
e322c07f837116 Lorenzo Bianconi       2019-11-27  145  }
e322c07f837116 Lorenzo Bianconi       2019-11-27  146 =20
9660c1d6968417 Jens Axboe             2024-04-10  147  static ssize_t airti=
me_flags_write(struct kiocb *iocb, struct iov_iter *from)
e322c07f837116 Lorenzo Bianconi       2019-11-27  148  {
9660c1d6968417 Jens Axboe             2024-04-10  149  	struct ieee80211_lo=
cal *local =3D iocb->ki_filp->private_data;
9660c1d6968417 Jens Axboe             2024-04-10  150  	size_t count =3D io=
v_iter_count(from);
e322c07f837116 Lorenzo Bianconi       2019-11-27  151  	char buf[16];
e322c07f837116 Lorenzo Bianconi       2019-11-27  152 =20
6020d534fa012b Shayne Chen            2021-01-12  153  	if (count >=3D size=
of(buf))
e322c07f837116 Lorenzo Bianconi       2019-11-27  154  		return -EINVAL;
e322c07f837116 Lorenzo Bianconi       2019-11-27  155 =20
9660c1d6968417 Jens Axboe             2024-04-10  156  	if (!copy_from_iter=
_full(buf, count, from))
e322c07f837116 Lorenzo Bianconi       2019-11-27  157  		return -EFAULT;
e322c07f837116 Lorenzo Bianconi       2019-11-27  158 =20
6020d534fa012b Shayne Chen            2021-01-12  159  	if (count && buf[co=
unt - 1] =3D=3D '\n')
6020d534fa012b Shayne Chen            2021-01-12 @160  		buf[count - 1] =3D =
'\0';
6020d534fa012b Shayne Chen            2021-01-12  161  	else
6020d534fa012b Shayne Chen            2021-01-12  162  		buf[count] =3D '\0=
';
e322c07f837116 Lorenzo Bianconi       2019-11-27  163 =20
e322c07f837116 Lorenzo Bianconi       2019-11-27  164  	if (kstrtou16(buf, =
0, &local->airtime_flags))
e322c07f837116 Lorenzo Bianconi       2019-11-27  165  		return -EINVAL;
e322c07f837116 Lorenzo Bianconi       2019-11-27  166 =20
e322c07f837116 Lorenzo Bianconi       2019-11-27  167  	return count;
e322c07f837116 Lorenzo Bianconi       2019-11-27  168  }
e322c07f837116 Lorenzo Bianconi       2019-11-27  169 =20
31cb94f71c1ba1 Johannes Berg          2024-10-22  170  static const struct =
debugfs_short_fops airtime_flags_ops =3D {
9660c1d6968417 Jens Axboe             2024-04-10  171  	.write_iter =3D air=
time_flags_write,
9660c1d6968417 Jens Axboe             2024-04-10  172  	.read_iter =3D airt=
ime_flags_read,
e322c07f837116 Lorenzo Bianconi       2019-11-27  173  	.llseek =3D default=
_llseek,
e322c07f837116 Lorenzo Bianconi       2019-11-27  174  };
e322c07f837116 Lorenzo Bianconi       2019-11-27  175 =20
9660c1d6968417 Jens Axboe             2024-04-10  176  static ssize_t aql_p=
ending_read(struct kiocb *iocb, struct iov_iter *to)
3db2c5604f39e3 Felix Fietkau          2022-06-25  177  {
9660c1d6968417 Jens Axboe             2024-04-10  178  	struct ieee80211_lo=
cal *local =3D iocb->ki_filp->private_data;
3db2c5604f39e3 Felix Fietkau          2022-06-25  179  	char buf[400];
3db2c5604f39e3 Felix Fietkau          2022-06-25  180  	int len =3D 0;
3db2c5604f39e3 Felix Fietkau          2022-06-25  181 =20
3db2c5604f39e3 Felix Fietkau          2022-06-25  182  	len =3D scnprintf(b=
uf, sizeof(buf),
3db2c5604f39e3 Felix Fietkau          2022-06-25  183  			"AC     AQL pendi=
ng\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  184  			"VO     %u us\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  185  			"VI     %u us\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  186  			"BE     %u us\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  187  			"BK     %u us\n"
3db2c5604f39e3 Felix Fietkau          2022-06-25  188  			"total  %u us\n",
3db2c5604f39e3 Felix Fietkau          2022-06-25  189  			atomic_read(&loca=
l->aql_ac_pending_airtime[IEEE80211_AC_VO]),
3db2c5604f39e3 Felix Fietkau          2022-06-25  190  			atomic_read(&loca=
l->aql_ac_pending_airtime[IEEE80211_AC_VI]),
3db2c5604f39e3 Felix Fietkau          2022-06-25  191  			atomic_read(&loca=
l->aql_ac_pending_airtime[IEEE80211_AC_BE]),
3db2c5604f39e3 Felix Fietkau          2022-06-25  192  			atomic_read(&loca=
l->aql_ac_pending_airtime[IEEE80211_AC_BK]),
3db2c5604f39e3 Felix Fietkau          2022-06-25  193  			atomic_read(&loca=
l->aql_total_pending_airtime));
9660c1d6968417 Jens Axboe             2024-04-10  194  	return simple_copy_=
to_iter(buf, &iocb->ki_pos, len, to);
3db2c5604f39e3 Felix Fietkau          2022-06-25  195  }
3db2c5604f39e3 Felix Fietkau          2022-06-25  196 =20
31cb94f71c1ba1 Johannes Berg          2024-10-22  197  static const struct =
debugfs_short_fops aql_pending_ops =3D {
9660c1d6968417 Jens Axboe             2024-04-10  198  	.read_iter =3D aql_=
pending_read,
3db2c5604f39e3 Felix Fietkau          2022-06-25  199  	.llseek =3D default=
_llseek,
3db2c5604f39e3 Felix Fietkau          2022-06-25  200  };
3db2c5604f39e3 Felix Fietkau          2022-06-25  201 =20
9660c1d6968417 Jens Axboe             2024-04-10  202  static ssize_t aql_t=
xq_limit_read(struct kiocb *iocb, struct iov_iter *to)
3ace10f5b5ad94 Kan Yan                2019-11-18  203  {
9660c1d6968417 Jens Axboe             2024-04-10  204  	struct ieee80211_lo=
cal *local =3D iocb->ki_filp->private_data;
3ace10f5b5ad94 Kan Yan                2019-11-18  205  	char buf[400];
3ace10f5b5ad94 Kan Yan                2019-11-18  206  	int len =3D 0;
3ace10f5b5ad94 Kan Yan                2019-11-18  207 =20
3ace10f5b5ad94 Kan Yan                2019-11-18  208  	len =3D scnprintf(b=
uf, sizeof(buf),
3ace10f5b5ad94 Kan Yan                2019-11-18  209  			"AC	AQL limit low=
	AQL limit high\n"
3ace10f5b5ad94 Kan Yan                2019-11-18  210  			"VO	%u		%u\n"
3ace10f5b5ad94 Kan Yan                2019-11-18  211  			"VI	%u		%u\n"
3ace10f5b5ad94 Kan Yan                2019-11-18  212  			"BE	%u		%u\n"
3ace10f5b5ad94 Kan Yan                2019-11-18  213  			"BK	%u		%u\n",
942741dabcb432 Felix Fietkau          2022-06-25  214  			local->aql_txq_li=
mit_low[IEEE80211_AC_VO],
942741dabcb432 Felix Fietkau          2022-06-25  215  			local->aql_txq_li=
mit_high[IEEE80211_AC_VO],
942741dabcb432 Felix Fietkau          2022-06-25  216  			local->aql_txq_li=
mit_low[IEEE80211_AC_VI],
942741dabcb432 Felix Fietkau          2022-06-25  217  			local->aql_txq_li=
mit_high[IEEE80211_AC_VI],
942741dabcb432 Felix Fietkau          2022-06-25  218  			local->aql_txq_li=
mit_low[IEEE80211_AC_BE],
942741dabcb432 Felix Fietkau          2022-06-25  219  			local->aql_txq_li=
mit_high[IEEE80211_AC_BE],
942741dabcb432 Felix Fietkau          2022-06-25  220  			local->aql_txq_li=
mit_low[IEEE80211_AC_BK],
942741dabcb432 Felix Fietkau          2022-06-25  221  			local->aql_txq_li=
mit_high[IEEE80211_AC_BK]);
9660c1d6968417 Jens Axboe             2024-04-10  222  	return simple_copy_=
to_iter(buf, &iocb->ki_pos, len, to);
3ace10f5b5ad94 Kan Yan                2019-11-18  223  }
3ace10f5b5ad94 Kan Yan                2019-11-18  224 =20
9660c1d6968417 Jens Axboe             2024-04-10  225  static ssize_t aql_t=
xq_limit_write(struct kiocb *iocb, struct iov_iter *from)
3ace10f5b5ad94 Kan Yan                2019-11-18  226  {
9660c1d6968417 Jens Axboe             2024-04-10  227  	struct ieee80211_lo=
cal *local =3D iocb->ki_filp->private_data;
9660c1d6968417 Jens Axboe             2024-04-10  228  	size_t count =3D io=
v_iter_count(from);
3ace10f5b5ad94 Kan Yan                2019-11-18  229  	char buf[100];
3ace10f5b5ad94 Kan Yan                2019-11-18  230  	u32 ac, q_limit_low=
, q_limit_high, q_limit_low_old, q_limit_high_old;
3ace10f5b5ad94 Kan Yan                2019-11-18  231  	struct sta_info *st=
a;
3ace10f5b5ad94 Kan Yan                2019-11-18  232 =20
6020d534fa012b Shayne Chen            2021-01-12  233  	if (count >=3D size=
of(buf))
3ace10f5b5ad94 Kan Yan                2019-11-18  234  		return -EINVAL;
3ace10f5b5ad94 Kan Yan                2019-11-18  235 =20
9660c1d6968417 Jens Axboe             2024-04-10  236  	if (!copy_from_iter=
_full(buf, count, from))
3ace10f5b5ad94 Kan Yan                2019-11-18  237  		return -EFAULT;
3ace10f5b5ad94 Kan Yan                2019-11-18  238 =20
6020d534fa012b Shayne Chen            2021-01-12  239  	if (count && buf[co=
unt - 1] =3D=3D '\n')
6020d534fa012b Shayne Chen            2021-01-12 @240  		buf[count - 1] =3D =
'\0';
6020d534fa012b Shayne Chen            2021-01-12  241  	else
6020d534fa012b Shayne Chen            2021-01-12  242  		buf[count] =3D '\0=
';
3ace10f5b5ad94 Kan Yan                2019-11-18  243 =20
3ace10f5b5ad94 Kan Yan                2019-11-18  244  	if (sscanf(buf, "%u=
 %u %u", &ac, &q_limit_low, &q_limit_high) !=3D 3)
3ace10f5b5ad94 Kan Yan                2019-11-18  245  		return -EINVAL;
3ace10f5b5ad94 Kan Yan                2019-11-18  246 =20
3ace10f5b5ad94 Kan Yan                2019-11-18  247  	if (ac >=3D IEEE802=
11_NUM_ACS)
3ace10f5b5ad94 Kan Yan                2019-11-18  248  		return -EINVAL;
3ace10f5b5ad94 Kan Yan                2019-11-18  249 =20
942741dabcb432 Felix Fietkau          2022-06-25  250  	q_limit_low_old =3D =
local->aql_txq_limit_low[ac];
942741dabcb432 Felix Fietkau          2022-06-25  251  	q_limit_high_old =
=3D local->aql_txq_limit_high[ac];
3ace10f5b5ad94 Kan Yan                2019-11-18  252 =20
8e66f6c6738e5b Johannes Berg          2024-11-22  253  	guard(wiphy)(local-=
>hw.wiphy);
8e66f6c6738e5b Johannes Berg          2024-11-22  254 =20
942741dabcb432 Felix Fietkau          2022-06-25  255  	local->aql_txq_limi=
t_low[ac] =3D q_limit_low;
942741dabcb432 Felix Fietkau          2022-06-25  256  	local->aql_txq_limi=
t_high[ac] =3D q_limit_high;
3ace10f5b5ad94 Kan Yan                2019-11-18  257 =20
3ace10f5b5ad94 Kan Yan                2019-11-18  258  	list_for_each_entry=
(sta, &local->sta_list, list) {
3ace10f5b5ad94 Kan Yan                2019-11-18  259  		/* If a sta has cu=
stomized queue limits, keep it */
3ace10f5b5ad94 Kan Yan                2019-11-18  260  		if (sta->airtime[a=
c].aql_limit_low =3D=3D q_limit_low_old &&
3ace10f5b5ad94 Kan Yan                2019-11-18  261  		    sta->airtime[a=
c].aql_limit_high =3D=3D q_limit_high_old) {
3ace10f5b5ad94 Kan Yan                2019-11-18  262  			sta->airtime[ac].=
aql_limit_low =3D q_limit_low;
3ace10f5b5ad94 Kan Yan                2019-11-18  263  			sta->airtime[ac].=
aql_limit_high =3D q_limit_high;
3ace10f5b5ad94 Kan Yan                2019-11-18  264  		}
3ace10f5b5ad94 Kan Yan                2019-11-18  265  	}
4d3acf4311a040 Johannes Berg          2023-08-28  266 =20
3ace10f5b5ad94 Kan Yan                2019-11-18  267  	return count;
3ace10f5b5ad94 Kan Yan                2019-11-18  268  }
3ace10f5b5ad94 Kan Yan                2019-11-18  269 =20

:::::: The code at line 109 was first introduced by commit
:::::: 6020d534fa012b80c6d13811dc4d2dfedca2e403 mac80211: fix incorrect str=
len of .write in debugfs

:::::: TO: Shayne Chen <shayne.chen@mediatek.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
