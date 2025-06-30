Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B81225D8F0
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299867; cv=none; b=NC29SGQmO4f9hCTPw1Mbbh/cPSL0CkrbS06ExvIjfPmEJQm6O+ttoga1yAUVnXHmLirc5dZggga2wEMVOqH8PNoha+2DlwFLfTGOpqFuYKEjxkrvFn5CJGJ5nugJidvlTYqI8MSdbwjxvIKKw6CGfWEycI8YNAGf1iqwkV/NDsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299867; c=relaxed/simple;
	bh=AX8qgl2cffMEVWaTwnrr3LcqdLFK3uG4nHHa1AZSDbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibAijhluzRNKDY7AyfulUCdYh0W9HikJqGccWykqOP8YETz/XJD1QUb5sniIlYZUo3CA8guXVzjTm9dhFrmhvCXO/t0/H1voGbIO2KjGdGvNX+KPG+EaUHtlV615Bxzq6JR07y8u1Qy73h6IqYquGyDgBIa7Ra2Vt4v3pmP+cQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BriQ676u; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BriQ676u"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2d09d495c6cso833262fac.3
        for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 09:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751299865; x=1751904665; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uHB6h21m6dOEITRK2ywET9pNdNRkHfbkgrdjpub1gk=;
        b=BriQ676u8PlyMlz2nns2yLRA7Z+I3xWuv/Lf2+7smBSKnhiwUS3/iEODVOYdvh46WG
         NqRmBD6GlZUOo/vcjzdC4y+UAVadFfDPw7OA3DhgHArxIYfTl0Pyq5hrpjJ30CjAH4Iz
         gXVn1Hvc5Z+OT6ryllw+jH8Ud4+AK/vtGQaSjRgLzEMFbs8mCPg5n7RPfpo04QYxySRK
         nO4tzk3BEFmsvnYYdgGkAEEMD3iyMhga6B/RCjGAf7GmABwIMJdCos25JoMf16GDLl75
         SfaGGGALmLMqKNzWfb/x+l6yJ+RNsvZFrlsZxlvuPWSc1CitU45dfUZdGtqHz3ri1i5h
         aukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751299865; x=1751904665;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uHB6h21m6dOEITRK2ywET9pNdNRkHfbkgrdjpub1gk=;
        b=ufEeUqrcSn22hg93jcQRgEMK5UH4Sm0wg/0DFCup+vFlEHMWnMM3bJND0TrHLVezbd
         50vi6++CN6DPiYBPzaWfvJKVaq/24aTmCr//zgO8rbVk7Ydbbgbs2WoLzrQVsLkgBhnO
         wHl2SEPMxwaSqk2jP2Yew9LPaXiLNuhW43PfRdXRJXMXnQ+L0Emg56/yXXMvh7Bhj/mU
         per/NbhwULynJ30ZMF1+15g6WL8a2q1Efep73LVUS6uZw0hvcSyIYR87Fb+i0Q336lgW
         6eibwHFaenWHNwGeYe+f6/iAVQ5PR+pC8xoVodNGEruKzWrjpndLKDe5VcCj5r02CHYC
         IcBA==
X-Gm-Message-State: AOJu0YxEMg+qhTg5j4yVwPyuB63tv4SYr+jnMXcQyq+qHuRFS6e1fusb
	B03cJjmbGuSryGr0Mtx7jbIas/GMa95o2CiuXYtAHc23/7S/POtwScJ0IcVhS4YASgss1j+cKH1
	ubfl4Vkc=
X-Gm-Gg: ASbGncteB/lwQEdiGcsKHZfX03cD3ooPovz1NXJ5dzZxxIa2tj7HDlQN4vQv5NGda7Z
	3BhfYFkphTdGNXnsroh37/fiI7HFJx01eEtu5xE09pP7CDKU+nCtK6EBJz1u/vm+/27/LuUlk1v
	cEUFwtv5XjH6gCh4howFd5HaoytrcWh7Qn8vhekuDTExbtscrLiYdmzFsvfK3+MxeqfhXwfZ31T
	BKEZY0TA/+o4vJGwFXQ6sw2hMCKs4xvsg/pr9ZweTTxif4owuiMwrQr8lb2/9yRa2hAYcwTy9w9
	QRGAJ8AH6uncutcY32A4S0E5TG+1WURe6vqKNVU93OgsyrT1bPPkfa912cUlsuzoZxZe
X-Google-Smtp-Source: AGHT+IGwq1koJ5VoxQg+dfxfpf0Fak1N3LEBXOYqiT1HPw0p3HRWsHnb4G6GXhOzFg/7aIprVPPi4Q==
X-Received: by 2002:a05:6870:d92:b0:2ea:70ad:4517 with SMTP id 586e51a60fabf-2efed4f4f3emr8639800fac.15.1751299864345;
        Mon, 30 Jun 2025 09:11:04 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4c35a57sm2784843fac.0.2025.06.30.09.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:11:03 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:11:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Subject: [linux-next:master 2617/5998] drivers/net/dsa/b53/b53_common.c:1885
 b53_arl_op() error: uninitialized symbol 'fwd_entry'.
Message-ID: <3119b2fe-0d72-4217-ac1d-1d8665e17baa@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: c45655386e532c85ff1d679fc2aa40b3aaff9916 [2617/5998] net: dsa: b53: add support for FDB operations on 5325/5365
config: powerpc64-randconfig-r072-20250627 (https://download.01.org/0day-ci/archive/20250628/202506281631.qxLRO5eu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506281631.qxLRO5eu-lkp@intel.com/

smatch warnings:
drivers/net/dsa/b53/b53_common.c:1885 b53_arl_op() error: uninitialized symbol 'fwd_entry'.

vim +/fwd_entry +1885 drivers/net/dsa/b53/b53_common.c

1da6df85c6fbed Florian Fainelli       2016-06-09  1806  static int b53_arl_op(struct b53_device *dev, int op, int port,
1da6df85c6fbed Florian Fainelli       2016-06-09  1807  		      const unsigned char *addr, u16 vid, bool is_valid)
1da6df85c6fbed Florian Fainelli       2016-06-09  1808  {
1da6df85c6fbed Florian Fainelli       2016-06-09  1809  	struct b53_arl_entry ent;
1da6df85c6fbed Florian Fainelli       2016-06-09  1810  	u32 fwd_entry;
1da6df85c6fbed Florian Fainelli       2016-06-09  1811  	u64 mac, mac_vid = 0;
1da6df85c6fbed Florian Fainelli       2016-06-09  1812  	u8 idx = 0;
1da6df85c6fbed Florian Fainelli       2016-06-09  1813  	int ret;
1da6df85c6fbed Florian Fainelli       2016-06-09  1814  
1da6df85c6fbed Florian Fainelli       2016-06-09  1815  	/* Convert the array into a 64-bit MAC */
4b92ea81cca38e Florian Fainelli       2017-01-05  1816  	mac = ether_addr_to_u64(addr);
1da6df85c6fbed Florian Fainelli       2016-06-09  1817  
1da6df85c6fbed Florian Fainelli       2016-06-09  1818  	/* Perform a read for the given MAC and VID */
1da6df85c6fbed Florian Fainelli       2016-06-09  1819  	b53_write48(dev, B53_ARLIO_PAGE, B53_MAC_ADDR_IDX, mac);
0cbec9aef5a861 Álvaro Fernández Rojas 2025-06-14  1820  	if (!is5325m(dev))
1da6df85c6fbed Florian Fainelli       2016-06-09  1821  		b53_write16(dev, B53_ARLIO_PAGE, B53_VLAN_ID_IDX, vid);
1da6df85c6fbed Florian Fainelli       2016-06-09  1822  
1da6df85c6fbed Florian Fainelli       2016-06-09  1823  	/* Issue a read operation for this MAC */
1da6df85c6fbed Florian Fainelli       2016-06-09  1824  	ret = b53_arl_rw_op(dev, 1);
1da6df85c6fbed Florian Fainelli       2016-06-09  1825  	if (ret)
1da6df85c6fbed Florian Fainelli       2016-06-09  1826  		return ret;
1da6df85c6fbed Florian Fainelli       2016-06-09  1827  
c45655386e532c Florian Fainelli       2025-06-14  1828  	if (is5325(dev) || is5365(dev))
c45655386e532c Florian Fainelli       2025-06-14  1829  		ret = b53_arl_read_25(dev, mac, vid, &ent, &idx);
c45655386e532c Florian Fainelli       2025-06-14  1830  	else
ef2a0bd99b1549 Florian Fainelli       2020-04-30  1831  		ret = b53_arl_read(dev, mac, vid, &ent, &idx);
ef2a0bd99b1549 Florian Fainelli       2020-04-30  1832  
1da6df85c6fbed Florian Fainelli       2016-06-09  1833  	/* If this is a read, just finish now */
1da6df85c6fbed Florian Fainelli       2016-06-09  1834  	if (op)
1da6df85c6fbed Florian Fainelli       2016-06-09  1835  		return ret;
1da6df85c6fbed Florian Fainelli       2016-06-09  1836  
6344dbde6a27d1 Florian Fainelli       2020-04-20  1837  	switch (ret) {
774d977abfd024 Tom Rix                2020-08-21  1838  	case -ETIMEDOUT:
774d977abfd024 Tom Rix                2020-08-21  1839  		return ret;
6344dbde6a27d1 Florian Fainelli       2020-04-20  1840  	case -ENOSPC:
6344dbde6a27d1 Florian Fainelli       2020-04-20  1841  		dev_dbg(dev->dev, "{%pM,%.4d} no space left in ARL\n",
6344dbde6a27d1 Florian Fainelli       2020-04-20  1842  			addr, vid);
6344dbde6a27d1 Florian Fainelli       2020-04-20  1843  		return is_valid ? ret : 0;
6344dbde6a27d1 Florian Fainelli       2020-04-20  1844  	case -ENOENT:
1da6df85c6fbed Florian Fainelli       2016-06-09  1845  		/* We could not find a matching MAC, so reset to a new entry */
6344dbde6a27d1 Florian Fainelli       2020-04-20  1846  		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
6344dbde6a27d1 Florian Fainelli       2020-04-20  1847  			addr, vid, idx);
1da6df85c6fbed Florian Fainelli       2016-06-09  1848  		fwd_entry = 0;

This warning is a false positive.  But you could delete
this "fwd_entry = 0;" assignment since nothing uses it.

6344dbde6a27d1 Florian Fainelli       2020-04-20  1849  		break;
6344dbde6a27d1 Florian Fainelli       2020-04-20  1850  	default:
6344dbde6a27d1 Florian Fainelli       2020-04-20  1851  		dev_dbg(dev->dev, "{%pM,%.4d} found, using idx: %d\n",
6344dbde6a27d1 Florian Fainelli       2020-04-20  1852  			addr, vid, idx);
6344dbde6a27d1 Florian Fainelli       2020-04-20  1853  		break;
1da6df85c6fbed Florian Fainelli       2016-06-09  1854  	}
1da6df85c6fbed Florian Fainelli       2016-06-09  1855  
5d65b64a3d9701 Florian Fainelli       2019-10-24  1856  	/* For multicast address, the port is a bitmask and the validity
5d65b64a3d9701 Florian Fainelli       2019-10-24  1857  	 * is determined by having at least one port being still active
5d65b64a3d9701 Florian Fainelli       2019-10-24  1858  	 */
5d65b64a3d9701 Florian Fainelli       2019-10-24  1859  	if (!is_multicast_ether_addr(addr)) {
1da6df85c6fbed Florian Fainelli       2016-06-09  1860  		ent.port = port;
1da6df85c6fbed Florian Fainelli       2016-06-09  1861  		ent.is_valid = is_valid;
5d65b64a3d9701 Florian Fainelli       2019-10-24  1862  	} else {
5d65b64a3d9701 Florian Fainelli       2019-10-24  1863  		if (is_valid)
5d65b64a3d9701 Florian Fainelli       2019-10-24  1864  			ent.port |= BIT(port);
5d65b64a3d9701 Florian Fainelli       2019-10-24  1865  		else
5d65b64a3d9701 Florian Fainelli       2019-10-24  1866  			ent.port &= ~BIT(port);
5d65b64a3d9701 Florian Fainelli       2019-10-24  1867  
5d65b64a3d9701 Florian Fainelli       2019-10-24  1868  		ent.is_valid = !!(ent.port);
5d65b64a3d9701 Florian Fainelli       2019-10-24  1869  	}
5d65b64a3d9701 Florian Fainelli       2019-10-24  1870  
1da6df85c6fbed Florian Fainelli       2016-06-09  1871  	ent.vid = vid;
1da6df85c6fbed Florian Fainelli       2016-06-09  1872  	ent.is_static = true;
5d65b64a3d9701 Florian Fainelli       2019-10-24  1873  	ent.is_age = false;
1da6df85c6fbed Florian Fainelli       2016-06-09  1874  	memcpy(ent.mac, addr, ETH_ALEN);
c45655386e532c Florian Fainelli       2025-06-14  1875  	if (is5325(dev) || is5365(dev))
c45655386e532c Florian Fainelli       2025-06-14  1876  		b53_arl_from_entry_25(&mac_vid, &ent);
c45655386e532c Florian Fainelli       2025-06-14  1877  	else
1da6df85c6fbed Florian Fainelli       2016-06-09  1878  		b53_arl_from_entry(&mac_vid, &fwd_entry, &ent);
1da6df85c6fbed Florian Fainelli       2016-06-09  1879  
1da6df85c6fbed Florian Fainelli       2016-06-09  1880  	b53_write64(dev, B53_ARLIO_PAGE,
1da6df85c6fbed Florian Fainelli       2016-06-09  1881  		    B53_ARLTBL_MAC_VID_ENTRY(idx), mac_vid);
c45655386e532c Florian Fainelli       2025-06-14  1882  
c45655386e532c Florian Fainelli       2025-06-14  1883  	if (!is5325(dev) && !is5365(dev))
1da6df85c6fbed Florian Fainelli       2016-06-09  1884  		b53_write32(dev, B53_ARLIO_PAGE,
1da6df85c6fbed Florian Fainelli       2016-06-09 @1885  			    B53_ARLTBL_DATA_ENTRY(idx), fwd_entry);
1da6df85c6fbed Florian Fainelli       2016-06-09  1886  
1da6df85c6fbed Florian Fainelli       2016-06-09  1887  	return b53_arl_rw_op(dev, 0);
1da6df85c6fbed Florian Fainelli       2016-06-09  1888  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

