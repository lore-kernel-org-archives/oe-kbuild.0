Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB9628E7
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 05:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719378037; cv=none; b=b/ZtGtOWauFL/eX/Rg5rxA+oKCNWyTORcuVRVwR5FULRWnt9ohJ5yBvL5QDuIaDn4COrA9D3HQ/P36QHhR1rvH4sHLUvBDkL7QLUmFnt7bvg/41COUsOPeGivXlvXuux/gZ/H8Naiwm26yV67aqnCDs2DxncL+v58SI8iOx8umY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719378037; c=relaxed/simple;
	bh=qlkc91ByEF1gkpiPaxwwcWeRKbvzHzEcBbWTapQeBDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tPfHcUiaSwDaM1i+KSq/q6Ik6vh5Nd6Q/X25A0UVZ1pxOWlcYluS2vhQm3Q/+KR4KY5mYIkA5RsgmpflehzXHB+JEnSe15wbVWjWzAMnvHZGeSS02QnF75MTpieKCZHwZSbe9r0fqSnzAlPOMPrxCXY2/8mPv164rAfv3Nm9kIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxlcjvH2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxlcjvH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719378034; x=1750914034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qlkc91ByEF1gkpiPaxwwcWeRKbvzHzEcBbWTapQeBDc=;
  b=ZxlcjvH2GnZaVClT9ybCsWQMnJPqKttCw+yY87rTRQ23Ghu7plbYhISl
   p0EZiGeal3lexUVnhdnwqn/grRSNq4yel7gfjL3kB4VPExXEavSHYGcn7
   b1tHwongpFJnAMCRt42VUGZ3PjK+Z0YRWUgCRcIKpAyda5E2PMLNK53ee
   dAoPYe/O15F98NTP4fndtMA6bPMsMZ1fnKif0a7J1U9YHaly3aaQ//lan
   K37KAteeaq5KvchNuYfvJv4mJ+jYVw1Sqdq/WVFr3BMkjj03X+ADGwLD+
   ArJxxSbSCJ1EdaXZqOy6Q1k+Ha0fd5IrAcazaT3DRB7OwOA6o2uWxgRdw
   g==;
X-CSE-ConnectionGUID: 9ffLZAX9RNuVE79DHZZOvw==
X-CSE-MsgGUID: Vhu09ZSxRRi5xjA5IBQ/vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16655887"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="16655887"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 22:00:34 -0700
X-CSE-ConnectionGUID: vfBZ+583QQOQ7YOxhqk/Kw==
X-CSE-MsgGUID: EgqTzpvTTcCRovRWo4LcDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="43686310"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Jun 2024 22:00:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMKlf-000F0c-1S;
	Wed, 26 Jun 2024 05:00:27 +0000
Date: Wed, 26 Jun 2024 12:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [isilence:zcrx/next-6.10-rebase 30/35] io_uring/zcrx.c:812
 io_zcrx_recv_skb() warn: check likely/unlikely parentheses
Message-ID: <202406261243.sPJ6xyvQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
commit: 217b71934ad9ee4fffd5eb975aae285911a16052 [30/35] io_uring/zcrx: prevent endless unresponsive execution
:::::: branch date: 29 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261243.sPJ6xyvQ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406261243.sPJ6xyvQ-lkp@intel.com/

smatch warnings:
io_uring/zcrx.c:812 io_zcrx_recv_skb() warn: check likely/unlikely parentheses

vim +812 io_uring/zcrx.c

f9ab1c1cb8fd3a David Wei      2024-03-05  799  
f9ab1c1cb8fd3a David Wei      2024-03-05  800  static int
f9ab1c1cb8fd3a David Wei      2024-03-05  801  io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
f9ab1c1cb8fd3a David Wei      2024-03-05  802  		 unsigned int offset, size_t len)
f9ab1c1cb8fd3a David Wei      2024-03-05  803  {
f9ab1c1cb8fd3a David Wei      2024-03-05  804  	struct io_zcrx_args *args = desc->arg.data;
f9ab1c1cb8fd3a David Wei      2024-03-05  805  	struct io_zcrx_ifq *ifq = args->ifq;
f9ab1c1cb8fd3a David Wei      2024-03-05  806  	struct io_kiocb *req = args->req;
f9ab1c1cb8fd3a David Wei      2024-03-05  807  	struct sk_buff *frag_iter;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  808  	unsigned start, start_off = offset;
f9ab1c1cb8fd3a David Wei      2024-03-05  809  	int i, copy, end, off;
f9ab1c1cb8fd3a David Wei      2024-03-05  810  	int ret = 0;
f9ab1c1cb8fd3a David Wei      2024-03-05  811  
217b71934ad9ee Pavel Begunkov 2024-04-17 @812  	if (unlikely(args->nr_skbs++) > IO_SKBS_PER_CALL_LIMIT)
217b71934ad9ee Pavel Begunkov 2024-04-17  813  		return -EAGAIN;
217b71934ad9ee Pavel Begunkov 2024-04-17  814  
4eb3e10e62f790 Pavel Begunkov 2024-03-05  815  	if (unlikely(offset < skb_headlen(skb))) {
4eb3e10e62f790 Pavel Begunkov 2024-03-05  816  		ssize_t copied;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  817  		size_t to_copy;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  818  
4eb3e10e62f790 Pavel Begunkov 2024-03-05  819  		to_copy = min_t(size_t, skb_headlen(skb) - offset, len);
4eb3e10e62f790 Pavel Begunkov 2024-03-05  820  		copied = io_zcrx_copy_chunk(req, ifq, skb->data, offset, to_copy);
4eb3e10e62f790 Pavel Begunkov 2024-03-05  821  		if (copied < 0) {
4eb3e10e62f790 Pavel Begunkov 2024-03-05  822  			ret = copied;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  823  			goto out;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  824  		}
4eb3e10e62f790 Pavel Begunkov 2024-03-05  825  		offset += copied;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  826  		len -= copied;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  827  		if (!len)
4eb3e10e62f790 Pavel Begunkov 2024-03-05  828  			goto out;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  829  		if (offset != skb_headlen(skb))
4eb3e10e62f790 Pavel Begunkov 2024-03-05  830  			goto out;
4eb3e10e62f790 Pavel Begunkov 2024-03-05  831  	}
f9ab1c1cb8fd3a David Wei      2024-03-05  832  
4eb3e10e62f790 Pavel Begunkov 2024-03-05  833  	start = skb_headlen(skb);
f9ab1c1cb8fd3a David Wei      2024-03-05  834  
f9ab1c1cb8fd3a David Wei      2024-03-05  835  	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
f9ab1c1cb8fd3a David Wei      2024-03-05  836  		const skb_frag_t *frag;
f9ab1c1cb8fd3a David Wei      2024-03-05  837  
f9ab1c1cb8fd3a David Wei      2024-03-05  838  		if (WARN_ON(start > offset + len))
f9ab1c1cb8fd3a David Wei      2024-03-05  839  			return -EFAULT;
f9ab1c1cb8fd3a David Wei      2024-03-05  840  
f9ab1c1cb8fd3a David Wei      2024-03-05  841  		frag = &skb_shinfo(skb)->frags[i];
f9ab1c1cb8fd3a David Wei      2024-03-05  842  		end = start + skb_frag_size(frag);
f9ab1c1cb8fd3a David Wei      2024-03-05  843  
f9ab1c1cb8fd3a David Wei      2024-03-05  844  		if (offset < end) {
f9ab1c1cb8fd3a David Wei      2024-03-05  845  			copy = end - offset;
f9ab1c1cb8fd3a David Wei      2024-03-05  846  			if (copy > len)
f9ab1c1cb8fd3a David Wei      2024-03-05  847  				copy = len;
f9ab1c1cb8fd3a David Wei      2024-03-05  848  
f9ab1c1cb8fd3a David Wei      2024-03-05  849  			off = offset - start;
f9ab1c1cb8fd3a David Wei      2024-03-05  850  			ret = io_zcrx_recv_frag(req, ifq, frag, off, copy);
f9ab1c1cb8fd3a David Wei      2024-03-05  851  			if (ret < 0)
f9ab1c1cb8fd3a David Wei      2024-03-05  852  				goto out;
f9ab1c1cb8fd3a David Wei      2024-03-05  853  
f9ab1c1cb8fd3a David Wei      2024-03-05  854  			offset += ret;
f9ab1c1cb8fd3a David Wei      2024-03-05  855  			len -= ret;
f9ab1c1cb8fd3a David Wei      2024-03-05  856  			if (len == 0 || ret != copy)
f9ab1c1cb8fd3a David Wei      2024-03-05  857  				goto out;
f9ab1c1cb8fd3a David Wei      2024-03-05  858  		}
f9ab1c1cb8fd3a David Wei      2024-03-05  859  		start = end;
f9ab1c1cb8fd3a David Wei      2024-03-05  860  	}
f9ab1c1cb8fd3a David Wei      2024-03-05  861  
f9ab1c1cb8fd3a David Wei      2024-03-05  862  	skb_walk_frags(skb, frag_iter) {
f9ab1c1cb8fd3a David Wei      2024-03-05  863  		if (WARN_ON(start > offset + len))
f9ab1c1cb8fd3a David Wei      2024-03-05  864  			return -EFAULT;
f9ab1c1cb8fd3a David Wei      2024-03-05  865  
f9ab1c1cb8fd3a David Wei      2024-03-05  866  		end = start + frag_iter->len;
f9ab1c1cb8fd3a David Wei      2024-03-05  867  		if (offset < end) {
f9ab1c1cb8fd3a David Wei      2024-03-05  868  			copy = end - offset;
f9ab1c1cb8fd3a David Wei      2024-03-05  869  			if (copy > len)
f9ab1c1cb8fd3a David Wei      2024-03-05  870  				copy = len;
f9ab1c1cb8fd3a David Wei      2024-03-05  871  
f9ab1c1cb8fd3a David Wei      2024-03-05  872  			off = offset - start;
f9ab1c1cb8fd3a David Wei      2024-03-05  873  			ret = io_zcrx_recv_skb(desc, frag_iter, off, copy);
f9ab1c1cb8fd3a David Wei      2024-03-05  874  			if (ret < 0)
f9ab1c1cb8fd3a David Wei      2024-03-05  875  				goto out;
f9ab1c1cb8fd3a David Wei      2024-03-05  876  
f9ab1c1cb8fd3a David Wei      2024-03-05  877  			offset += ret;
f9ab1c1cb8fd3a David Wei      2024-03-05  878  			len -= ret;
f9ab1c1cb8fd3a David Wei      2024-03-05  879  			if (len == 0 || ret != copy)
f9ab1c1cb8fd3a David Wei      2024-03-05  880  				goto out;
f9ab1c1cb8fd3a David Wei      2024-03-05  881  		}
f9ab1c1cb8fd3a David Wei      2024-03-05  882  		start = end;
f9ab1c1cb8fd3a David Wei      2024-03-05  883  	}
f9ab1c1cb8fd3a David Wei      2024-03-05  884  
f9ab1c1cb8fd3a David Wei      2024-03-05  885  out:
f9ab1c1cb8fd3a David Wei      2024-03-05  886  	if (offset == start_off)
f9ab1c1cb8fd3a David Wei      2024-03-05  887  		return ret;
f9ab1c1cb8fd3a David Wei      2024-03-05  888  	return offset - start_off;
f9ab1c1cb8fd3a David Wei      2024-03-05  889  }
f9ab1c1cb8fd3a David Wei      2024-03-05  890  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
