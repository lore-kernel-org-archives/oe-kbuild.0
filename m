Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795130129;
	b=XxDHdzcIE48jRjwVW7xuL9hOXNMOK0ul8t6xhg1QgrHIu2ojrz3glgO0KBNRBUeoruGm
	 kKxDAgyZ7C2ryTkccz8xjs17N3Z+H1pHNiNzpY088S8i0YqZ7h0fr05d1h9pxr/jyyC51
	 y3+66ZPGjr3dz5sM6257rE8ha6AqCrXRYmPVmI7+CCncu/FBtng4GRmt8/kEbV7+YM35o
	 MaeV07xSvo1e2ykhBwDHJnY38igyDsvs8PC5qVnYTFX75VMIxP8DuEhkcMoDczib293cj
	 iL3+vhdNr5z3u90mELeGCGEIJSd0EULX/WGEaMV4BM8zSCxXwvJotj7hOdbgZ1Uf9sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795130129;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=nNkqHWuOYo+9j8jAj4ImSMHKfUCHnOztzYm09V+ZVNI=;
	b=dZD791DBYBZmerseK3atyL47jnpQoZBSMNAJ/8B+hxiN9nTrddlfD37DyQcJbfQaPoPU
	 BcWaXfSMSLDoAOISDauWsJNVgFtcVUJ1XNOfnnvRNvTtUgY9DmYH+vmWu8DnUb3Hgy8z6
	 Ho95hsqt1QSioFqU4iliN9z1kxj0wEzyMDtnPFMJLXndHy2z2iMGZtYCfDOumAwaAunNk
	 2MSlJiGfanvUb3j7TYlwTEZnA6y66cSkLbmG/OkA1MAjQBQ3i7y7cPilx5QpbwEdeEuvO
	 3Qn4WikF6TsldAICQfzFPJ8NT2oOumUW0yt6zGoj4PbVWYcgcfoZQ6plGX8SrCdf27A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XfhoRheZ;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28865606A326
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 23:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28865606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XfhoRheZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795130129; x=1826666129;
  h=date:from:to:cc:subject:message-id;
  bh=wAkYlMAubnkbLaD7aBJtObHYbM62qSFH9V6Fa4qd0Qg=;
  b=XfhoRheZFLbs2s2OJPdx3IUoIRBvq3w2VsBPE3iLdmYJQvbgmERcWaTi
   57hCeaHPofyzQ650882m6CVl+lTwzS8vnUAcKYazvn0grgIKgP4PNIelp
   Kxr1SuJjj1doIdQv0TptDL60JrommNvHOWWbIqqSupLZCSrAB7GubZZsH
   0KMWWBkmE5YXpe7Tnrez/zFEkeQEKXvOJ7Br8pz0FLQJR58Db+n8WJ+Yw
   KNV0F4rZTg1ffrzcWa9Qw5syZYP9Ung7TM8Aj1Y3vBu1Alxk2j7nnVLiz
   wN4bnIfnNM0z5Lg9jrCqdg92WS3LY47pEz1LfR1LgsI3gieOV/dRJ/q4e
   Q==;
X-CSE-ConnectionGUID: tnJWiPNDTiO5V0xXneR97A==
X-CSE-MsgGUID: Oqu952t0R66ZuKLLOpKA8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3885655"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3885655"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 15:15:27 -0800
X-CSE-ConnectionGUID: IjI4z6M0T1Ga2oP2KaKqww==
X-CSE-MsgGUID: Fsr73tJzTpOQkmube93/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10884658"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Nov 2026 15:15:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUBLg-000000003sT-2Nna;
	Thu, 19 Nov 2026 23:15:24 +0000
Date: Fri, 20 Nov 2026 00:15:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bluetooth:master 84/88] net/bluetooth/hci_sync.c:1940
 hci_adv_bcast_annoucement() warn: missing error code 'err'
Message-ID: <20261120000952.fVZj2a5L-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-bluetooth@vger.kernel.org
TO: Cen Zhang <zzzccc427@gmail.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
head:   5052141b19fe0ab2863a12a0dcffac9aac6c8006
commit: d7e77168da348d8ac0fdb3b3aa7ce1ccc83208a7 [84/88] Bluetooth: hci_sync: Fix remaining advertising instance UAFs
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: hexagon-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261120/20261120000952.fVZj2a5L-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261120000952.fVZj2a5L-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_sync.c:1940 hci_adv_bcast_annoucement() warn: missing error code 'err'

vim +/err +1940 net/bluetooth/hci_sync.c

eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1914  
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1915  /* Checks if periodic advertising data contains a Basic Announcement and if it
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1916   * does generates a Broadcast ID and add Broadcast Announcement.
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1917   */
d7e77168da348d Cen Zhang              2026-11-19  1918  static int hci_adv_bcast_annoucement(struct hci_dev *hdev, u8 instance)
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1919  {
d7e77168da348d Cen Zhang              2026-11-19  1920  	struct adv_info *adv;
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1921  	u8 bid[3];
5725bc60825205 Luiz Augusto von Dentz 2025-06-05  1922  	u8 ad[HCI_MAX_EXT_AD_LENGTH];
5725bc60825205 Luiz Augusto von Dentz 2025-06-05  1923  	u8 len;
d7e77168da348d Cen Zhang              2026-11-19  1924  	int err = 0;
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1925  
d7e77168da348d Cen Zhang              2026-11-19  1926  	/* Skip if instance 0x00 as it is used for general purpose
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1927  	 * advertising so it cannot used for the likes of Broadcast Announcement
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1928  	 * as it can be overwritten at any point.
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1929  	 */
d7e77168da348d Cen Zhang              2026-11-19  1930  	if (!instance)
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1931  		return 0;
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1932  
d7e77168da348d Cen Zhang              2026-11-19  1933  	hci_dev_lock(hdev);
d7e77168da348d Cen Zhang              2026-11-19  1934  
d7e77168da348d Cen Zhang              2026-11-19  1935  	/* The instance may have been removed while waiting for the
d7e77168da348d Cen Zhang              2026-11-19  1936  	 * controller, in which case there is nothing to announce.
d7e77168da348d Cen Zhang              2026-11-19  1937  	 */
d7e77168da348d Cen Zhang              2026-11-19  1938  	adv = hci_find_adv_instance(hdev, instance);
d7e77168da348d Cen Zhang              2026-11-19  1939  	if (!adv)
d7e77168da348d Cen Zhang              2026-11-19 @1940  		goto unlock;
d7e77168da348d Cen Zhang              2026-11-19  1941  
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1942  	/* Check if PA data doesn't contains a Basic Audio Announcement then
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1943  	 * there is nothing to do.
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1944  	 */
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1945  	if (!eir_get_service_data(adv->per_adv_data, adv->per_adv_data_len,
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1946  				  0x1851, NULL))
d7e77168da348d Cen Zhang              2026-11-19  1947  		goto unlock;
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1948  
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1949  	/* Check if advertising data already has a Broadcast Announcement since
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1950  	 * the process may want to control the Broadcast ID directly and in that
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1951  	 * case the kernel shall no interfere.
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1952  	 */
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1953  	if (eir_get_service_data(adv->adv_data, adv->adv_data_len, 0x1852,
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1954  				 NULL))
d7e77168da348d Cen Zhang              2026-11-19  1955  		goto unlock;
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1956  
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1957  	/* Generate Broadcast ID */
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1958  	get_random_bytes(bid, sizeof(bid));
5725bc60825205 Luiz Augusto von Dentz 2025-06-05  1959  	len = eir_append_service_data(ad, 0, 0x1852, bid, sizeof(bid));
5c65b96b549ea2 Yuqi Xu                2026-05-29  1960  	if (adv->adv_data_len > sizeof(ad) - len) {
5c65b96b549ea2 Yuqi Xu                2026-05-29  1961  		bt_dev_err(hdev, "No room for Broadcast Announcement");
d7e77168da348d Cen Zhang              2026-11-19  1962  		err = -EINVAL;
d7e77168da348d Cen Zhang              2026-11-19  1963  		goto unlock;
5c65b96b549ea2 Yuqi Xu                2026-05-29  1964  	}
5c65b96b549ea2 Yuqi Xu                2026-05-29  1965  
5725bc60825205 Luiz Augusto von Dentz 2025-06-05  1966  	memcpy(ad + len, adv->adv_data, adv->adv_data_len);
d7e77168da348d Cen Zhang              2026-11-19  1967  	hci_set_adv_instance_data(hdev, instance, len + adv->adv_data_len,
5725bc60825205 Luiz Augusto von Dentz 2025-06-05  1968  				  ad, 0, NULL);
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1969  
d7e77168da348d Cen Zhang              2026-11-19  1970  	hci_dev_unlock(hdev);
d7e77168da348d Cen Zhang              2026-11-19  1971  
d7e77168da348d Cen Zhang              2026-11-19  1972  	return hci_update_adv_data_sync(hdev, instance);
d7e77168da348d Cen Zhang              2026-11-19  1973  
d7e77168da348d Cen Zhang              2026-11-19  1974  unlock:
d7e77168da348d Cen Zhang              2026-11-19  1975  	hci_dev_unlock(hdev);
d7e77168da348d Cen Zhang              2026-11-19  1976  	return err;
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1977  }
eca0ae4aea6691 Luiz Augusto von Dentz 2022-03-09  1978  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
