Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60511DA53
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Apr 2024 22:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714255498; cv=none; b=fjQY2SsFl4CDAy4rOzKwwH5kes2zJrobX06FRLMlExUcmtWJJ47yRCq3KHWyQ49DLeDGVUkNRdJIq/9y0gwErpJwtdvJya8h/M3Ua43EY8Qk/KK2huIlZPmUQx48S0eXSBB8tE4L+5Rql9fyuvhqzITUY6OzgYFkyuN14HaUyqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714255498; c=relaxed/simple;
	bh=Qv6bT+GAq1bl1T8Zp8Fv3ldZORhMp1BmRpjCsJhCuAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mKJRUliEljQP7y9/0mwNO66yNjE989BK7Lcw8KnrQziKRASluez75aD9TQB10eXGzUnbQWQthdMNCFB4hTObrL/2sLzNO8kgT3Yf+SpWKC/5aqvOuHemW0HKyb9+ciPQzn12mx05CmWCXX5sgCBFRKTpFqVjZTGqYOLULlr1FIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEVqLN7Y; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEVqLN7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714255496; x=1745791496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qv6bT+GAq1bl1T8Zp8Fv3ldZORhMp1BmRpjCsJhCuAw=;
  b=bEVqLN7YYd47rd5m9Jk4a4VosWh19SwQA9Tj1bC/0ctV73XZPVFM1+f+
   sE0aNFs2PKKUOKNz18QCT+uJR+y3javhMWSubMXZn2Ni2fUIVPeo/QVTZ
   nXbUkG7lEBGit1+AMPgqknpvAwIfpgnx1Xsjdp6S2uVXOtTjChme9rJTM
   408QvyWckBPDKm9QitvTxatOSFRKaleHZtSMwQe2UlADR1V5TbLhs7KAb
   Tfe42NwdIHIJCUwt6pqqsxj1+DtbOGPiFIMrUGbdHcUlVlew6pFtF0TZ4
   DWnu4nax0o19tkDUPxkGQ063ary0iDHcrmGkBPct/yXRaDE+G80A3/5+m
   Q==;
X-CSE-ConnectionGUID: X1cvcRL/SPGlEG9koDkJsg==
X-CSE-MsgGUID: mLIZXfWhQ3mfA+FDXfqUXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10070571"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="10070571"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 15:04:56 -0700
X-CSE-ConnectionGUID: EpZ1por2QbiA3tuRU0Xlfg==
X-CSE-MsgGUID: awhhtt5aTSyWKWkEZn/Qvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="63212716"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Apr 2024 15:04:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0qA7-0005Y6-1n;
	Sat, 27 Apr 2024 22:04:51 +0000
Date: Sun, 28 Apr 2024 06:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linyunsheng:page_frag_cache_v3 14/14] net/mptcp/protocol.c:1854
 mptcp_sendmsg() error: uninitialized symbol 'offset'.
Message-ID: <202404280525.UEsq07AR-lkp@intel.com>
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
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3
head:   d4839424731dee0af1ba520ac3b177893e765399
commit: d4839424731dee0af1ba520ac3b177893e765399 [14/14] net: replace page_frag with page_frag_cache
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-161-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280525.UEsq07AR-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404280525.UEsq07AR-lkp@intel.com/

smatch warnings:
net/mptcp/protocol.c:1854 mptcp_sendmsg() error: uninitialized symbol 'offset'.

vim +/offset +1854 net/mptcp/protocol.c

29b5e5ef873979 Paolo Abeni      2024-03-01  1794  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1795  static int mptcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1796  {
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1797  	struct mptcp_sock *msk = mptcp_sk(sk);
d4839424731dee Yunsheng Lin     2024-04-15  1798  	struct page_frag_cache *pfrag;
6d0060f600adfd Mat Martineau    2020-01-21  1799  	size_t copied = 0;
caf971df01b86f Paolo Abeni      2020-11-16  1800  	int ret = 0;
6d0060f600adfd Mat Martineau    2020-01-21  1801  	long timeo;
f870fa0b576884 Mat Martineau    2020-01-21  1802  
987858e5d026d3 Paolo Abeni      2021-04-23  1803  	/* silently ignore everything else */
1e777f39b4d75e Dmytro Shytyi    2022-11-25  1804  	msg->msg_flags &= MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL | MSG_FASTOPEN;
987858e5d026d3 Paolo Abeni      2021-04-23  1805  
6511882cdd82d6 Paolo Abeni      2021-10-26  1806  	lock_sock(sk);
1954b86016cf85 Mat Martineau    2020-02-28  1807  
08e39c0dfa29f2 Eric Dumazet     2023-08-16  1808  	if (unlikely(inet_test_bit(DEFER_CONNECT, sk) ||
08e39c0dfa29f2 Eric Dumazet     2023-08-16  1809  		     msg->msg_flags & MSG_FASTOPEN)) {
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1810  		int copied_syn = 0;
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1811  
a2702a076e7378 Paolo Abeni      2023-04-14  1812  		ret = mptcp_sendmsg_fastopen(sk, msg, len, &copied_syn);
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1813  		copied += copied_syn;
fa9e57468aa10e Paolo Abeni      2022-10-21  1814  		if (ret == -EINPROGRESS && copied_syn > 0)
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1815  			goto out;
fa9e57468aa10e Paolo Abeni      2022-10-21  1816  		else if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1817  			goto do_error;
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1818  	}
d98a82a6afc764 Dmytro Shytyi    2022-09-26  1819  
1954b86016cf85 Mat Martineau    2020-02-28  1820  	timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
1954b86016cf85 Mat Martineau    2020-02-28  1821  
1954b86016cf85 Mat Martineau    2020-02-28  1822  	if ((1 << sk->sk_state) & ~(TCPF_ESTABLISHED | TCPF_CLOSE_WAIT)) {
1954b86016cf85 Mat Martineau    2020-02-28  1823  		ret = sk_stream_wait_connect(sk, &timeo);
1954b86016cf85 Mat Martineau    2020-02-28  1824  		if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1825  			goto do_error;
1954b86016cf85 Mat Martineau    2020-02-28  1826  	}
1954b86016cf85 Mat Martineau    2020-02-28  1827  
69800e516e968f Paolo Abeni      2022-09-30  1828  	ret = -EPIPE;
69800e516e968f Paolo Abeni      2022-09-30  1829  	if (unlikely(sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)))
69800e516e968f Paolo Abeni      2022-09-30  1830  		goto do_error;
69800e516e968f Paolo Abeni      2022-09-30  1831  
17091708d1e503 Florian Westphal 2020-05-16  1832  	pfrag = sk_page_frag(sk);
18b683bff89d46 Paolo Abeni      2020-03-27  1833  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1834  	while (msg_data_left(msg)) {
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1835  		int total_ts, frag_truesize = 0;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1836  		struct mptcp_data_frag *dfrag;
d4839424731dee Yunsheng Lin     2024-04-15  1837  		bool dfrag_collapsed = false;
d4839424731dee Yunsheng Lin     2024-04-15  1838  		unsigned int offset, size;
d4839424731dee Yunsheng Lin     2024-04-15  1839  		struct page *page;
d4839424731dee Yunsheng Lin     2024-04-15  1840  		size_t psize;
29b5e5ef873979 Paolo Abeni      2024-03-01  1841  		u32 copy_limit;
d4839424731dee Yunsheng Lin     2024-04-15  1842  		void *va;
29b5e5ef873979 Paolo Abeni      2024-03-01  1843  
29b5e5ef873979 Paolo Abeni      2024-03-01  1844  		/* ensure fitting the notsent_lowat() constraint */
29b5e5ef873979 Paolo Abeni      2024-03-01  1845  		copy_limit = mptcp_send_limit(sk);
29b5e5ef873979 Paolo Abeni      2024-03-01  1846  		if (!copy_limit)
29b5e5ef873979 Paolo Abeni      2024-03-01  1847  			goto wait_for_memory;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1848  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1849  		/* reuse tail pfrag, if possible, or carve a new one from the
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1850  		 * page allocator
fb529e62d3f3e8 Florian Westphal 2020-05-16  1851  		 */
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1852  		dfrag = mptcp_pending_tail(sk);
d4839424731dee Yunsheng Lin     2024-04-15  1853  		page = page_frag_alloc_probe(pfrag, &offset, &size, &va);
d4839424731dee Yunsheng Lin     2024-04-15 @1854  		dfrag_collapsed = mptcp_frag_can_collapse_to(msk, page, offset,
d4839424731dee Yunsheng Lin     2024-04-15  1855  							     size, dfrag);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1856  		if (!dfrag_collapsed) {
d4839424731dee Yunsheng Lin     2024-04-15  1857  			size = 32U + sizeof(struct mptcp_data_frag);
d4839424731dee Yunsheng Lin     2024-04-15  1858  			page = mptcp_page_frag_alloc_prepare(sk, pfrag, &offset,
d4839424731dee Yunsheng Lin     2024-04-15  1859  							     &size, &va);
d4839424731dee Yunsheng Lin     2024-04-15  1860  			if (!page)
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1861  				goto wait_for_memory;
cec37a6e41aae7 Peter Krystad    2020-01-21  1862  
d4839424731dee Yunsheng Lin     2024-04-15  1863  			dfrag = mptcp_carve_data_frag(msk, page, offset);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1864  			frag_truesize = dfrag->overhead;
d4839424731dee Yunsheng Lin     2024-04-15  1865  			va += dfrag->overhead;
72511aab95c94d Florian Westphal 2020-05-16  1866  		}
6d0060f600adfd Mat Martineau    2020-01-21  1867  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1868  		/* we do not bound vs wspace, to allow a single packet.
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1869  		 * memory accounting will prevent execessive memory usage
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1870  		 * anyway
d5f49190def61c Paolo Abeni      2020-09-14  1871  		 */
d4839424731dee Yunsheng Lin     2024-04-15  1872  		psize = size - frag_truesize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1873  		psize = min_t(size_t, psize, msg_data_left(msg));
29b5e5ef873979 Paolo Abeni      2024-03-01  1874  		psize = min_t(size_t, psize, copy_limit);
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1875  		total_ts = psize + frag_truesize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1876  
6511882cdd82d6 Paolo Abeni      2021-10-26  1877  		if (!sk_wmem_schedule(sk, total_ts))
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1878  			goto wait_for_memory;
724cfd2ee8aa12 Paolo Abeni      2020-11-27  1879  
d4839424731dee Yunsheng Lin     2024-04-15  1880  		ret = do_copy_data_nocache(sk, psize, &msg->msg_iter, va);
0ffe8e74904027 Paolo Abeni      2023-10-23  1881  		if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1882  			goto do_error;
72511aab95c94d Florian Westphal 2020-05-16  1883  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1884  		/* data successfully copied into the write queue */
5e6300e7b3a4ab Eric Dumazet     2023-08-31  1885  		sk_forward_alloc_add(sk, -total_ts);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1886  		copied += psize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1887  		dfrag->data_len += psize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1888  		frag_truesize += psize;
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1889  		WRITE_ONCE(msk->write_seq, msk->write_seq + psize);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1890  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1891  		/* charge data on mptcp pending queue to the msk socket
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1892  		 * Note: we charge such data both to sk and ssk
fb529e62d3f3e8 Florian Westphal 2020-05-16  1893  		 */
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1894  		sk_wmem_queued_add(sk, frag_truesize);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1895  		if (!dfrag_collapsed) {
d4839424731dee Yunsheng Lin     2024-04-15  1896  			page_frag_alloc_commit(pfrag, frag_truesize);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1897  			list_add_tail(&dfrag->list, &msk->rtx_queue);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1898  			if (!msk->first_pending)
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1899  				WRITE_ONCE(msk->first_pending, dfrag);
d4839424731dee Yunsheng Lin     2024-04-15  1900  		} else {
d4839424731dee Yunsheng Lin     2024-04-15  1901  			page_frag_alloc_commit_noref(pfrag, frag_truesize);
6d0060f600adfd Mat Martineau    2020-01-21  1902  		}
d4839424731dee Yunsheng Lin     2024-04-15  1903  
e4b6135134a75f Geliang Tang     2021-04-16  1904  		pr_debug("msk=%p dfrag at seq=%llu len=%u sent=%u new=%d", msk,
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1905  			 dfrag->data_seq, dfrag->data_len, dfrag->already_sent,
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1906  			 !dfrag_collapsed);
6d0060f600adfd Mat Martineau    2020-01-21  1907  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1908  		continue;
b51f9b80c032e1 Paolo Abeni      2020-03-27  1909  
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1910  wait_for_memory:
037db6ea57da7a Paolo Abeni      2024-03-01  1911  		set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
c2e6048fa1cf22 Paolo Abeni      2021-03-04  1912  		__mptcp_push_pending(sk, msg->msg_flags);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1913  		ret = sk_stream_wait_memory(sk, &timeo);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1914  		if (ret)
69800e516e968f Paolo Abeni      2022-09-30  1915  			goto do_error;
57040755a3e43a Paolo Abeni      2020-01-21  1916  	}
6d0060f600adfd Mat Martineau    2020-01-21  1917  
13e1603739e58e Paolo Abeni      2020-12-16  1918  	if (copied)
c2e6048fa1cf22 Paolo Abeni      2021-03-04  1919  		__mptcp_push_pending(sk, msg->msg_flags);
d9ca1de8c0cd7a Paolo Abeni      2020-11-16  1920  
1954b86016cf85 Mat Martineau    2020-02-28  1921  out:
cec37a6e41aae7 Peter Krystad    2020-01-21  1922  	release_sock(sk);
69800e516e968f Paolo Abeni      2022-09-30  1923  	return copied;
69800e516e968f Paolo Abeni      2022-09-30  1924  
69800e516e968f Paolo Abeni      2022-09-30  1925  do_error:
69800e516e968f Paolo Abeni      2022-09-30  1926  	if (copied)
69800e516e968f Paolo Abeni      2022-09-30  1927  		goto out;
69800e516e968f Paolo Abeni      2022-09-30  1928  
69800e516e968f Paolo Abeni      2022-09-30  1929  	copied = sk_stream_error(sk, msg->msg_flags, ret);
69800e516e968f Paolo Abeni      2022-09-30  1930  	goto out;
f870fa0b576884 Mat Martineau    2020-01-21  1931  }
f870fa0b576884 Mat Martineau    2020-01-21  1932  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
