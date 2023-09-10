Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1540320F1
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Sep 2023 10:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694343048; x=1725879048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d7P/dZIY5WHp2ZKwi1+byn1e0Vu3ADjWaO/iWDJETxw=;
  b=Ur3swpiImxrv9VtwceiqRmoo6DXi5IZsvnhNrXySr4DFY1TiKC7B6GH+
   583fgfft7n9LRAwvsMhvaOZ8GCk0YnFLKGcgshwf4YL/JtwaX/+TQ5qZU
   96ZBWDGdRCw0LX/LQ7sNbqDaJNxr4P//ZcTP06K0szpKlAghYJdJ3v3nk
   Imh2QsgmS4nG5CQTJEYINX5acFuMs0V6kMmeJgYX4rDU9jrVMptNGdGBW
   YzIJszGyCHXbBB14qMZu2jAp9C4X/HbWm2IMBwVy5izJ1Osba01FQMjD1
   FHcV6IA9oj6jjmNnjVNi2lggAv2nPuik30jEfwcO5nNHj7okXwaYAIJM9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="381705734"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="381705734"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 03:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="886165768"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="886165768"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2023 03:50:24 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfI1b-0004oq-2X;
	Sun, 10 Sep 2023 10:50:43 +0000
Date: Sun, 10 Sep 2023 18:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sashal-stable:pending-6.5 113/614] net/bluetooth/hci_conn.c:1865
 hci_le_set_cig_params() warn: passing zero to 'ERR_PTR'
Message-ID: <202309101846.IbVuaBP1-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.5
head:   d7b2c87760b5779ce9c35f6ab4c8b67a13655061
commit: bde9dde7e710700cb3ecb2dd3e7eb35cd7752226 [113/614] Bluetooth: hci_conn: Fix hci_le_set_cig_params
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20230910 (https://download.01.org/0day-ci/archive/20230910/202309101846.IbVuaBP1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230910/202309101846.IbVuaBP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309101846.IbVuaBP1-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_conn.c:1865 hci_le_set_cig_params() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +1865 net/bluetooth/hci_conn.c

6b9545dc9f8ff0 Pauli Virtanen         2023-06-01  1811  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1812  static bool hci_le_set_cig_params(struct hci_conn *conn, struct bt_iso_qos *qos)
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1813  {
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1814  	struct hci_dev *hdev = conn->hdev;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1815  	struct iso_list_data data;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1816  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1817  	memset(&data, 0, sizeof(data));
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1818  
e6a7a46b8636ef Pauli Virtanen         2023-05-21  1819  	/* Allocate first still reconfigurable CIG if not set */
0fe8c8d071343f Iulia Tanasescu        2023-03-31  1820  	if (qos->ucast.cig == BT_ISO_QOS_CIG_UNSET) {
e6a7a46b8636ef Pauli Virtanen         2023-05-21  1821  		for (data.cig = 0x00; data.cig < 0xf0; data.cig++) {
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1822  			data.count = 0;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1823  
e6a7a46b8636ef Pauli Virtanen         2023-05-21  1824  			hci_conn_hash_list_state(hdev, find_cis, ISO_LINK,
e6a7a46b8636ef Pauli Virtanen         2023-05-21  1825  						 BT_CONNECT, &data);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1826  			if (data.count)
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1827  				continue;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1828  
e6a7a46b8636ef Pauli Virtanen         2023-05-21  1829  			hci_conn_hash_list_state(hdev, find_cis, ISO_LINK,
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1830  						 BT_CONNECTED, &data);
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1831  			if (!data.count)
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1832  				break;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1833  		}
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1834  
e6a7a46b8636ef Pauli Virtanen         2023-05-21  1835  		if (data.cig == 0xf0)
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1836  			return false;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1837  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1838  		/* Update CIG */
0fe8c8d071343f Iulia Tanasescu        2023-03-31  1839  		qos->ucast.cig = data.cig;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1840  	}
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1841  
0fe8c8d071343f Iulia Tanasescu        2023-03-31  1842  	if (qos->ucast.cis != BT_ISO_QOS_CIS_UNSET) {
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1843  		if (hci_conn_hash_lookup_cis(hdev, NULL, 0, qos->ucast.cig,
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1844  					     qos->ucast.cis))
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1845  			return false;
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1846  		goto done;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1847  	}
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1848  
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1849  	/* Allocate first available CIS if not set */
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1850  	for (data.cig = qos->ucast.cig, data.cis = 0x00; data.cis < 0xf0;
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1851  	     data.cis++) {
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1852  		if (!hci_conn_hash_lookup_cis(hdev, NULL, 0, data.cig,
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1853  					      data.cis)) {
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1854  			/* Update CIS */
0fe8c8d071343f Iulia Tanasescu        2023-03-31  1855  			qos->ucast.cis = data.cis;
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1856  			break;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1857  		}
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1858  	}
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1859  
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1860  	if (qos->ucast.cis == BT_ISO_QOS_CIS_UNSET)
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1861  		return false;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1862  
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1863  done:
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04  1864  	if (hci_cmd_sync_queue(hdev, set_cig_params_sync,
bde9dde7e71070 Luiz Augusto von Dentz 2023-08-04 @1865  			       ERR_PTR(qos->ucast.cig), NULL) < 0)
6b9545dc9f8ff0 Pauli Virtanen         2023-06-01  1866  		return false;
6b9545dc9f8ff0 Pauli Virtanen         2023-06-01  1867  
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1868  	return true;
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1869  }
26afbd826ee326 Luiz Augusto von Dentz 2019-07-29  1870  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
