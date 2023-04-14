Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52727C
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Apr 2023 05:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681449378; x=1712985378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RPM1cEdDbwmi28zVwdFnzyBMARkFOzPCeorSdwxfEcA=;
  b=W3pi0eQy2JgO+OsEERm7aGZeQYdBPqp0gQ0s4H+PgBhixhan7D+sdgwD
   E0KGnvEVvxiG7EoclDpTJp01xHuD8lp2xl9LtKXUTPJq5b+ypoDW+OH8Y
   MJF/x2Bz3/bq3KIleCg3M5+dspGtKfIwESwywIoVt41X4mYqqN+6qtHMx
   Kmp4XfbVvjNVa5U8SsTaGJi9ajRwj4nhVjSI36nm9GJEmdjXWhmsjj4Jd
   t0ppTi91hKE/zRNAjz+XEKDtCc3HQbrXra5DoI1NdyouBMvMDCyVAouzn
   12zk6kC+E/IWISUmnb7Iyk5N9QZwiE8Qu9F+G7a9xR47i8JObrK680vUM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="407256205"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="407256205"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 22:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="801048186"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="801048186"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2023 22:16:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnBnD-000ZGB-2R;
	Fri, 14 Apr 2023 05:16:15 +0000
Date: Fri, 14 Apr 2023 13:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC net-next v2 3/4] vsock: Add lockless sendmsg() support
Message-ID: <202304141302.mVWCQivU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: net/vmw_vsock/vmci_transport.c:1326:17: sparse: sparse: typename in expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230413-b4-vsock-dgram-v2-3-079cc7cee62e@bytedance.com>
References: <20230413-b4-vsock-dgram-v2-3-079cc7cee62e@bytedance.com>
TO: Bobby Eshleman <bobby.eshleman@bytedance.com>

Hi Bobby,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ed72bd5a6790a0c3747cb32b0427f921bd03bb71]

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/virtio-vsock-support-dgram/20230414-082831
base:   ed72bd5a6790a0c3747cb32b0427f921bd03bb71
patch link:    https://lore.kernel.org/r/20230413-b4-vsock-dgram-v2-3-079cc7cee62e%40bytedance.com
patch subject: [PATCH RFC net-next v2 3/4] vsock: Add lockless sendmsg() support
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230414/202304141302.mVWCQivU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/de4d5e13dd5c747996abbc4e9ce38eeb3093ea01
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bobby-Eshleman/virtio-vsock-support-dgram/20230414-082831
        git checkout de4d5e13dd5c747996abbc4e9ce38eeb3093ea01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash net/vmw_vsock/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304141302.mVWCQivU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/vmw_vsock/vmci_transport.c:1326:17: sparse: sparse: typename in expression
   net/vmw_vsock/vmci_transport.c:1326:24: sparse: sparse: Expected ; at end of statement
   net/vmw_vsock/vmci_transport.c:1326:24: sparse: sparse: got sockaddr_vm_rcu
   net/vmw_vsock/vmci_transport.c:1326:17: sparse: sparse: undefined identifier 'struct'
   net/vmw_vsock/vmci_transport.c:1329:17: sparse: sparse: undefined identifier 'remote_addr'
>> net/vmw_vsock/vmci_transport.c:1329:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> net/vmw_vsock/vmci_transport.c:1329:31: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
>> net/vmw_vsock/vmci_transport.c:1329:31: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/vmci_transport.c:1330:22: sparse: sparse: undefined identifier 'remote_addr'
   net/vmw_vsock/vmci_transport.c:1338:47: sparse: sparse: undefined identifier 'remote_addr'
--
>> net/vmw_vsock/af_vsock.c:1026:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> net/vmw_vsock/af_vsock.c:1026:23: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
>> net/vmw_vsock/af_vsock.c:1026:23: sparse:    struct sockaddr_vm_rcu *
>> net/vmw_vsock/af_vsock.c:1026:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> net/vmw_vsock/af_vsock.c:1026:23: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
>> net/vmw_vsock/af_vsock.c:1026:23: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:154:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:154:23: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:154:23: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:172:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:172:23: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:172:23: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:202:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:202:23: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:202:23: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:228:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:228:15: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:228:15: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:239:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:239:15: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:239:15: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:239:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:239:15: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:239:15: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:256:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:256:15: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:256:15: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:256:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:256:15: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:256:15: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:269:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:269:23: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:269:23: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:393:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:393:31: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:393:31: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:418:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:418:23: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:418:23: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:934:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:934:9: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:934:9: sparse:    struct sockaddr_vm_rcu *
   net/vmw_vsock/af_vsock.c:1131:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/vmw_vsock/af_vsock.c:1131:27: sparse:    struct sockaddr_vm_rcu [noderef] __rcu *
   net/vmw_vsock/af_vsock.c:1131:27: sparse:    struct sockaddr_vm_rcu *
>> net/vmw_vsock/af_vsock.c:239:15: sparse: sparse: dereference of noderef expression
   net/vmw_vsock/af_vsock.c:219:5: sparse: sparse: context imbalance in 'vsock_remote_addr_update_cid_port' - different lock contexts for basic block
   net/vmw_vsock/af_vsock.c:256:15: sparse: sparse: dereference of noderef expression
   net/vmw_vsock/af_vsock.c:1026:23: sparse: sparse: dereference of noderef expression
   net/vmw_vsock/af_vsock.c:1158:9: sparse: sparse: context imbalance in 'vsock_getname' - different lock contexts for basic block

vim +1326 net/vmw_vsock/vmci_transport.c

d021c344051af9 Andy King       2013-02-06  1292  
d021c344051af9 Andy King       2013-02-06  1293  static int
d021c344051af9 Andy King       2013-02-06  1294  vmci_transport_recv_connecting_client(struct sock *sk,
d021c344051af9 Andy King       2013-02-06  1295  				      struct vmci_transport_packet *pkt)
d021c344051af9 Andy King       2013-02-06  1296  {
d021c344051af9 Andy King       2013-02-06  1297  	struct vsock_sock *vsk;
d021c344051af9 Andy King       2013-02-06  1298  	int err;
d021c344051af9 Andy King       2013-02-06  1299  	int skerr;
d021c344051af9 Andy King       2013-02-06  1300  
d021c344051af9 Andy King       2013-02-06  1301  	vsk = vsock_sk(sk);
d021c344051af9 Andy King       2013-02-06  1302  
d021c344051af9 Andy King       2013-02-06  1303  	switch (pkt->type) {
d021c344051af9 Andy King       2013-02-06  1304  	case VMCI_TRANSPORT_PACKET_TYPE_ATTACH:
d021c344051af9 Andy King       2013-02-06  1305  		if (vmci_handle_is_invalid(pkt->u.handle) ||
d021c344051af9 Andy King       2013-02-06  1306  		    !vmci_handle_is_equal(pkt->u.handle,
d021c344051af9 Andy King       2013-02-06  1307  					  vmci_trans(vsk)->qp_handle)) {
d021c344051af9 Andy King       2013-02-06  1308  			skerr = EPROTO;
d021c344051af9 Andy King       2013-02-06  1309  			err = -EINVAL;
d021c344051af9 Andy King       2013-02-06  1310  			goto destroy;
d021c344051af9 Andy King       2013-02-06  1311  		}
d021c344051af9 Andy King       2013-02-06  1312  
d021c344051af9 Andy King       2013-02-06  1313  		/* Signify the socket is connected and wakeup the waiter in
d021c344051af9 Andy King       2013-02-06  1314  		 * connect(). Also place the socket in the connected table for
d021c344051af9 Andy King       2013-02-06  1315  		 * accounting (it can already be found since it's in the bound
d021c344051af9 Andy King       2013-02-06  1316  		 * table).
d021c344051af9 Andy King       2013-02-06  1317  		 */
3b4477d2dcf270 Stefan Hajnoczi 2017-10-05  1318  		sk->sk_state = TCP_ESTABLISHED;
d021c344051af9 Andy King       2013-02-06  1319  		sk->sk_socket->state = SS_CONNECTED;
d021c344051af9 Andy King       2013-02-06  1320  		vsock_insert_connected(vsk);
d021c344051af9 Andy King       2013-02-06  1321  		sk->sk_state_change(sk);
d021c344051af9 Andy King       2013-02-06  1322  
d021c344051af9 Andy King       2013-02-06  1323  		break;
d021c344051af9 Andy King       2013-02-06  1324  	case VMCI_TRANSPORT_PACKET_TYPE_NEGOTIATE:
d021c344051af9 Andy King       2013-02-06  1325  	case VMCI_TRANSPORT_PACKET_TYPE_NEGOTIATE2:
de4d5e13dd5c74 Bobby Eshleman  2023-04-14 @1326  		struct sockaddr_vm_rcu *remote_addr;
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1327  
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1328  		rcu_read_lock();
de4d5e13dd5c74 Bobby Eshleman  2023-04-14 @1329  		remote_addr = rcu_dereference(vsk->remote_addr);
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1330  		if (!remote_addr) {
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1331  			skerr = EPROTO;
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1332  			err = -EINVAL;
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1333  			rcu_read_unlock();
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1334  			goto destroy;
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1335  		}
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1336  
d021c344051af9 Andy King       2013-02-06  1337  		if (pkt->u.size == 0
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1338  		    || pkt->dg.src.context != remote_addr->addr.svm_cid
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1339  		    || pkt->src_port != remote_addr->addr.svm_port
d021c344051af9 Andy King       2013-02-06  1340  		    || !vmci_handle_is_invalid(vmci_trans(vsk)->qp_handle)
d021c344051af9 Andy King       2013-02-06  1341  		    || vmci_trans(vsk)->qpair
d021c344051af9 Andy King       2013-02-06  1342  		    || vmci_trans(vsk)->produce_size != 0
d021c344051af9 Andy King       2013-02-06  1343  		    || vmci_trans(vsk)->consume_size != 0
d021c344051af9 Andy King       2013-02-06  1344  		    || vmci_trans(vsk)->detach_sub_id != VMCI_INVALID_ID) {
d021c344051af9 Andy King       2013-02-06  1345  			skerr = EPROTO;
d021c344051af9 Andy King       2013-02-06  1346  			err = -EINVAL;
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1347  			rcu_read_unlock();
d021c344051af9 Andy King       2013-02-06  1348  			goto destroy;
d021c344051af9 Andy King       2013-02-06  1349  		}
de4d5e13dd5c74 Bobby Eshleman  2023-04-14  1350  		rcu_read_unlock();
d021c344051af9 Andy King       2013-02-06  1351  
d021c344051af9 Andy King       2013-02-06  1352  		err = vmci_transport_recv_connecting_client_negotiate(sk, pkt);
d021c344051af9 Andy King       2013-02-06  1353  		if (err) {
d021c344051af9 Andy King       2013-02-06  1354  			skerr = -err;
d021c344051af9 Andy King       2013-02-06  1355  			goto destroy;
d021c344051af9 Andy King       2013-02-06  1356  		}
d021c344051af9 Andy King       2013-02-06  1357  
d021c344051af9 Andy King       2013-02-06  1358  		break;
d021c344051af9 Andy King       2013-02-06  1359  	case VMCI_TRANSPORT_PACKET_TYPE_INVALID:
d021c344051af9 Andy King       2013-02-06  1360  		err = vmci_transport_recv_connecting_client_invalid(sk, pkt);
d021c344051af9 Andy King       2013-02-06  1361  		if (err) {
d021c344051af9 Andy King       2013-02-06  1362  			skerr = -err;
d021c344051af9 Andy King       2013-02-06  1363  			goto destroy;
d021c344051af9 Andy King       2013-02-06  1364  		}
d021c344051af9 Andy King       2013-02-06  1365  
d021c344051af9 Andy King       2013-02-06  1366  		break;
d021c344051af9 Andy King       2013-02-06  1367  	case VMCI_TRANSPORT_PACKET_TYPE_RST:
d021c344051af9 Andy King       2013-02-06  1368  		/* Older versions of the linux code (WS 6.5 / ESX 4.0) used to
d021c344051af9 Andy King       2013-02-06  1369  		 * continue processing here after they sent an INVALID packet.
d021c344051af9 Andy King       2013-02-06  1370  		 * This meant that we got a RST after the INVALID. We ignore a
d021c344051af9 Andy King       2013-02-06  1371  		 * RST after an INVALID. The common code doesn't send the RST
d021c344051af9 Andy King       2013-02-06  1372  		 * ... so we can hang if an old version of the common code
d021c344051af9 Andy King       2013-02-06  1373  		 * fails between getting a REQUEST and sending an OFFER back.
d021c344051af9 Andy King       2013-02-06  1374  		 * Not much we can do about it... except hope that it doesn't
d021c344051af9 Andy King       2013-02-06  1375  		 * happen.
d021c344051af9 Andy King       2013-02-06  1376  		 */
d021c344051af9 Andy King       2013-02-06  1377  		if (vsk->ignore_connecting_rst) {
d021c344051af9 Andy King       2013-02-06  1378  			vsk->ignore_connecting_rst = false;
d021c344051af9 Andy King       2013-02-06  1379  		} else {
d021c344051af9 Andy King       2013-02-06  1380  			skerr = ECONNRESET;
d021c344051af9 Andy King       2013-02-06  1381  			err = 0;
d021c344051af9 Andy King       2013-02-06  1382  			goto destroy;
d021c344051af9 Andy King       2013-02-06  1383  		}
d021c344051af9 Andy King       2013-02-06  1384  
d021c344051af9 Andy King       2013-02-06  1385  		break;
d021c344051af9 Andy King       2013-02-06  1386  	default:
d021c344051af9 Andy King       2013-02-06  1387  		/* Close and cleanup the connection. */
d021c344051af9 Andy King       2013-02-06  1388  		skerr = EPROTO;
d021c344051af9 Andy King       2013-02-06  1389  		err = -EINVAL;
d021c344051af9 Andy King       2013-02-06  1390  		goto destroy;
d021c344051af9 Andy King       2013-02-06  1391  	}
d021c344051af9 Andy King       2013-02-06  1392  
d021c344051af9 Andy King       2013-02-06  1393  	return 0;
d021c344051af9 Andy King       2013-02-06  1394  
d021c344051af9 Andy King       2013-02-06  1395  destroy:
d021c344051af9 Andy King       2013-02-06  1396  	vmci_transport_send_reset(sk, pkt);
d021c344051af9 Andy King       2013-02-06  1397  
3b4477d2dcf270 Stefan Hajnoczi 2017-10-05  1398  	sk->sk_state = TCP_CLOSE;
d021c344051af9 Andy King       2013-02-06  1399  	sk->sk_err = skerr;
e3ae2365efc142 Alexander Aring 2021-06-27  1400  	sk_error_report(sk);
d021c344051af9 Andy King       2013-02-06  1401  	return err;
d021c344051af9 Andy King       2013-02-06  1402  }
d021c344051af9 Andy King       2013-02-06  1403  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
