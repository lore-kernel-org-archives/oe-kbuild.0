Content-Type: multipart/mixed; boundary="===============5036623270615383755=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hare-scsi-devel:tls-upcall.v2 155/159] drivers/nvme/host/tcp.c:1318:8: warning: Value stored to 'tls_hs_type' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Feb 2022 19:52:49 +0800
Message-ID: <202202271939.X8xhqpEf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5036623270615383755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hannes Reinecke <hare@suse.de>

Hi Hannes,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git=
 tls-upcall.v2
head:   21b520ae0b338bd30496feb1ca90a2820dab7a65
commit: ac729ea3c52bda460616c71d5f5fc47b2e64da6d [155/159] tls: define TLS_=
RECORD_TYPE_HANDSHAKE
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20227/202202271939.X8xhqpEf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.g=
it/commit/?id=3Dac729ea3c52bda460616c71d5f5fc47b2e64da6d
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux=
/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-upcall.v2
        git checkout ac729ea3c52bda460616c71d5f5fc47b2e64da6d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/target/iscsi/iscsi_target_parameters.c:919:2: warning: Value sto=
red to 'acceptor_values' is never read [clang-analyzer-deadcode.DeadStores]
           acceptor_values =3D param->value;
           ^                 ~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target_parameters.c:919:2: note: Value stored=
 to 'acceptor_values' is never read
           acceptor_values =3D param->value;
           ^                 ~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/target/iscsi/iscsi_target_device.c:54:2: warning: Value stored t=
o 'max_cmd_sn' is never read [clang-analyzer-deadcode.DeadStores]
           max_cmd_sn =3D atomic_inc_return(&sess->max_cmd_sn);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/target/iscsi/iscsi_target_device.c:54:2: note: Value stored to '=
max_cmd_sn' is never read
           max_cmd_sn =3D atomic_inc_return(&sess->max_cmd_sn);
           ^            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   sound/soc/fsl/fsl_spdif.c:211:26: warning: Value stored to 'pdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:211:26: note: Value stored to 'pdev' during it=
s initialization is never read
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:227:26: warning: Value stored to 'pdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:227:26: note: Value stored to 'pdev' during it=
s initialization is never read
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:279:26: warning: Value stored to 'pdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:279:26: note: Value stored to 'pdev' during it=
s initialization is never read
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:296:26: warning: Value stored to 'pdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:296:26: note: Value stored to 'pdev' during it=
s initialization is never read
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:328:26: warning: Value stored to 'pdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:328:26: note: Value stored to 'pdev' during it=
s initialization is never read
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:430:26: warning: Value stored to 'pdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:430:26: note: Value stored to 'pdev' during it=
s initialization is never read
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:994:26: warning: Value stored to 'pdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   sound/soc/fsl/fsl_spdif.c:994:26: note: Value stored to 'pdev' during it=
s initialization is never read
           struct platform_device *pdev =3D spdif_priv->pdev;
                                   ^~~~   ~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/nvme/host/tcp.c:1318:8: warning: Value stored to 'tls_hs_type' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
                                   u8 tls_hs_type =3D (tls_hdr >> 24);
                                      ^~~~~~~~~~~   ~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1318:8: note: Value stored to 'tls_hs_type' duri=
ng its initialization is never read
                                   u8 tls_hs_type =3D (tls_hdr >> 24);
                                      ^~~~~~~~~~~   ~~~~~~~~~~~~~~~
   include/linux/scatterlist.h:214:16: warning: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage [clang-analyzer-core.uninitialized.Assign]
           sg->page_link |=3D SG_END;
                         ^
   drivers/nvme/host/tcp.c:2581:6: note: Assuming the condition is false
           if (!nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:2581:2: note: Taking false branch
           if (!nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
           ^
   drivers/nvme/host/tcp.c:2585:2: note: Taking false branch
           if (unlikely(ret))
           ^
   drivers/nvme/host/tcp.c:2590:2: note: Calling 'nvme_tcp_queue_request'
           nvme_tcp_queue_request(req, true, bd->last);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:296:10: note: Assuming the condition is true
           empty =3D llist_add(&req->lentry, &queue->req_list) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:296:10: note: Left side of '&&' is true
   drivers/nvme/host/tcp.c:297:3: note: Assuming the condition is true
                   list_empty(&queue->send_list) && !queue->request;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:296:10: note: Left side of '&&' is true
           empty =3D llist_add(&req->lentry, &queue->req_list) &&
                   ^
   drivers/nvme/host/tcp.c:297:36: note: Assuming field 'request' is null
                   list_empty(&queue->send_list) && !queue->request;
                                                    ^~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:304:23: note: Loop condition is false.  Exiting =
loop
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
                                ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/nvme/host/tcp.c:304:23: note: Control jumps to 'case 4:'  at lin=
e 304
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
                                ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   drivers/nvme/host/tcp.c:304:23: note:  Execution continues on line 304
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
                                ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:323:42: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                                   ^
   drivers/nvme/host/tcp.c:304:6: note: Assuming the condition is true
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:304:6: note: Left side of '&&' is true
   drivers/nvme/host/tcp.c:305:6: note: 'sync' is true
               sync && empty && mutex_trylock(&queue->send_mutex)) {
               ^~~~
   drivers/nvme/host/tcp.c:304:6: note: Left side of '&&' is true
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
               ^
   drivers/nvme/host/tcp.c:305:14: note: 'empty' is true
               sync && empty && mutex_trylock(&queue->send_mutex)) {
                       ^~~~~
   drivers/nvme/host/tcp.c:304:6: note: Left side of '&&' is true
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
               ^
   drivers/nvme/host/tcp.c:305:23: note: Assuming the condition is true
               sync && empty && mutex_trylock(&queue->send_mutex)) {
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:304:2: note: Taking true branch
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
           ^
   drivers/nvme/host/tcp.c:306:26: note: Assuming 'last' is true
                   queue->more_requests =3D !last;
                                          ^~~~~
   drivers/nvme/host/tcp.c:307:3: note: Calling 'nvme_tcp_send_all'
                   nvme_tcp_send_all(queue);
                   ^~~~~~~~~~~~~~~~~~~~~~~~
--
   fs/ext4/inode.c:5710:6: note: Assuming the condition is false
           if (unlikely(ext4_forced_shutdown(EXT4_SB(inode->i_sb))))
               ^
   include/linux/compiler.h:78:22: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:5710:2: note: Taking false branch
           if (unlikely(ext4_forced_shutdown(EXT4_SB(inode->i_sb))))
           ^
   fs/ext4/inode.c:5713:8: note: Calling 'ext4_get_inode_loc'
           err =3D ext4_get_inode_loc(inode, iloc);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:4541:2: note: 'err_blk' declared without an initial value
           ext4_fsblk_t err_blk;
           ^~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:4544:8: note: Calling '__ext4_get_inode_loc'
           ret =3D __ext4_get_inode_loc(inode->i_sb, inode->i_ino, inode, i=
loc,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/ext4/inode.c:4398:6: note: Assuming 'ino' is >=3D EXT4_ROOT_INO
           if (ino < EXT4_ROOT_INO ||
               ^~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:4398:6: note: Left side of '||' is false
   fs/ext4/inode.c:4399:6: note: Assuming 'ino' is <=3D field 's_inodes_cou=
nt'
               ino > le32_to_cpu(EXT4_SB(sb)->s_es->s_inodes_count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/inode.c:4398:2: note: Taking false branch
           if (ino < EXT4_ROOT_INO ||
           ^
   fs/ext4/inode.c:4404:6: note: Assuming 'gdp' is null
           if (!gdp)
               ^~~~
   fs/ext4/inode.c:4404:2: note: Taking true branch
           if (!gdp)
           ^
   fs/ext4/inode.c:4405:3: note: Returning without writing to '*ret_block'
                   return -EIO;
                   ^
   fs/ext4/inode.c:4544:8: note: Returning from '__ext4_get_inode_loc'
           ret =3D __ext4_get_inode_loc(inode->i_sb, inode->i_ino, inode, i=
loc,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/ext4/inode.c:4547:2: note: Taking true branch
           if (ret =3D=3D -EIO)
           ^
   fs/ext4/inode.c:4548:3: note: 4th function call argument is an uninitial=
ized value
                   ext4_error_inode_block(inode, err_blk, EIO,
                   ^
   fs/ext4/ext4.h:3156:2: note: expanded from macro 'ext4_error_inode_block'
           __ext4_error_inode((inode), __func__, __LINE__, (block), (err), \
           ^                                               ~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   net/sunrpc/auth_gss/gss_rpc_xdr.c:303:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_decode_hyper(p, &status->major_status);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:303:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_decode_hyper(p, &status->major_status);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:314:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_decode_hyper(p, &status->minor_status);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:314:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_decode_hyper(p, &status->minor_status);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:365:2: warning: Value stored to 'err' =
is never read [clang-analyzer-deadcode.DeadStores]
           err =3D gssx_enc_option(xdr, &opt);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:365:2: note: Value stored to 'err' is =
never read
           err =3D gssx_enc_option(xdr, &opt);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:607:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_encode_hyper(p, ctx->ctx_flags);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:607:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_encode_hyper(p, ctx->ctx_flags);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:670:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_decode_hyper(p, &ctx->ctx_flags);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:670:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_decode_hyper(p, &ctx->ctx_flags);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:698:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_encode_hyper(p, cb->initiator_addrtype);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:698:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_encode_hyper(p, cb->initiator_addrtype);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:709:2: warning: Value stored to 'p' is=
 never read [clang-analyzer-deadcode.DeadStores]
           p =3D xdr_encode_hyper(p, cb->acceptor_addrtype);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/gss_rpc_xdr.c:709:2: note: Value stored to 'p' is ne=
ver read
           p =3D xdr_encode_hyper(p, cb->acceptor_addrtype);
           ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
>> drivers/nvme/host/tcp.c:1318:8: warning: Value stored to 'tls_hs_type' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
                                   u8 tls_hs_type =3D (tls_hdr >> 24);
                                      ^~~~~~~~~~~   ~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1318:8: note: Value stored to 'tls_hs_type' duri=
ng its initialization is never read
                                   u8 tls_hs_type =3D (tls_hdr >> 24);
                                      ^~~~~~~~~~~   ~~~~~~~~~~~~~~~
   include/linux/scatterlist.h:214:16: warning: The left expression of the =
compound assignment is an uninitialized value. The computed value will also=
 be garbage [clang-analyzer-core.uninitialized.Assign]
           sg->page_link |=3D SG_END;
                         ^
   drivers/nvme/host/tcp.c:2581:6: note: Assuming the condition is false
           if (!nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:2581:2: note: Taking false branch
           if (!nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
           ^
   drivers/nvme/host/tcp.c:2585:2: note: Taking false branch
           if (unlikely(ret))
           ^
   drivers/nvme/host/tcp.c:2590:2: note: Calling 'nvme_tcp_queue_request'
           nvme_tcp_queue_request(req, true, bd->last);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:296:10: note: Assuming the condition is true
           empty =3D llist_add(&req->lentry, &queue->req_list) &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:296:10: note: Left side of '&&' is true
   drivers/nvme/host/tcp.c:297:3: note: Assuming the condition is true
                   list_empty(&queue->send_list) && !queue->request;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:296:10: note: Left side of '&&' is true
           empty =3D llist_add(&req->lentry, &queue->req_list) &&
                   ^
   drivers/nvme/host/tcp.c:297:36: note: Assuming field 'request' is null
                   list_empty(&queue->send_list) && !queue->request;
                                                    ^~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:304:23: note: Loop condition is false.  Exiting =
loop
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
                                ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:319:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/nvme/host/tcp.c:304:23: note: Control jumps to 'case 4:'  at lin=
e 304
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
                                ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:320:2: note: expanded from macro '__pcpu_siz=
e_call_return'
           switch(sizeof(variable)) {                                      \
           ^
   drivers/nvme/host/tcp.c:304:23: note:  Execution continues on line 304
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
                                ^
   arch/x86/include/asm/smp.h:166:33: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  this_cpu_read(cpu_number)
                                   ^
   include/linux/percpu-defs.h:507:29: note: expanded from macro 'this_cpu_=
read'
   #define this_cpu_read(pcp)              __pcpu_size_call_return(this_cpu=
_read_, pcp)
                                           ^
   include/linux/percpu-defs.h:323:42: note: expanded from macro '__pcpu_si=
ze_call_return'
           case 4: pscr_ret__ =3D stem##4(variable); break;                =
  \
                                                   ^
   drivers/nvme/host/tcp.c:304:6: note: Assuming the condition is true
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:304:6: note: Left side of '&&' is true
   drivers/nvme/host/tcp.c:305:6: note: 'sync' is true
               sync && empty && mutex_trylock(&queue->send_mutex)) {
               ^~~~
   drivers/nvme/host/tcp.c:304:6: note: Left side of '&&' is true
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
               ^
   drivers/nvme/host/tcp.c:305:14: note: 'empty' is true
               sync && empty && mutex_trylock(&queue->send_mutex)) {
                       ^~~~~
   drivers/nvme/host/tcp.c:304:6: note: Left side of '&&' is true
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
               ^
   drivers/nvme/host/tcp.c:305:23: note: Assuming the condition is true
               sync && empty && mutex_trylock(&queue->send_mutex)) {
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:304:2: note: Taking true branch
           if (queue->io_cpu =3D=3D raw_smp_processor_id() &&
           ^
   drivers/nvme/host/tcp.c:306:26: note: Assuming 'last' is true
                   queue->more_requests =3D !last;
                                          ^~~~~
   drivers/nvme/host/tcp.c:307:3: note: Calling 'nvme_tcp_send_all'
                   nvme_tcp_send_all(queue);
                   ^~~~~~~~~~~~~~~~~~~~~~~~

vim +/tls_hs_type +1318 drivers/nvme/host/tcp.c

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1255  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1256  static int nvme_tcp_init_c=
onnection(struct nvme_tcp_queue *queue)
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1257  {
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1258  	struct nvme_tcp_icreq_pdu=
 *icreq;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1259  	struct nvme_tcp_icresp_pd=
u *icresp;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1260  	struct msghdr msg =3D {};
83859876ef6b6f Hannes Reinecke 2022-02-23  1261  	char cbuf[CMSG_LEN(sizeof=
(char))];
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1262  	struct cmsghdr *cmsg;
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1263  	unsigned char ctype;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1264  	struct kvec iov;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1265  	bool ctrl_hdgst, ctrl_ddg=
st;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1266  	int ret;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1267  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1268  	icreq =3D kzalloc(sizeof(=
*icreq), GFP_KERNEL);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1269  	if (!icreq)
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1270  		return -ENOMEM;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1271  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1272  	icresp =3D kzalloc(sizeof=
(*icresp), GFP_KERNEL);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1273  	if (!icresp) {
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1274  		ret =3D -ENOMEM;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1275  		goto free_icreq;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1276  	}
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1277  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1278  	icreq->hdr.type =3D nvme_=
tcp_icreq;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1279  	icreq->hdr.hlen =3D sizeo=
f(*icreq);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1280  	icreq->hdr.pdo =3D 0;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1281  	icreq->hdr.plen =3D cpu_t=
o_le32(icreq->hdr.hlen);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1282  	icreq->pfv =3D cpu_to_le1=
6(NVME_TCP_PFV_1_0);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1283  	icreq->maxr2t =3D 0; /* s=
ingle inflight r2t supported */
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1284  	icreq->hpda =3D 0; /* no =
alignment constraint */
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1285  	if (queue->hdr_digest)
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1286  		icreq->digest |=3D NVME_=
TCP_HDR_DIGEST_ENABLE;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1287  	if (queue->data_digest)
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1288  		icreq->digest |=3D NVME_=
TCP_DATA_DIGEST_ENABLE;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1289  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1290  	iov.iov_base =3D icreq;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1291  	iov.iov_len =3D sizeof(*i=
creq);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1292  	ret =3D kernel_sendmsg(qu=
eue->sock, &msg, &iov, 1, iov.iov_len);
6e498960c93f88 Hannes Reinecke 2022-02-18  1293  	if (ret < 0) {
6e498960c93f88 Hannes Reinecke 2022-02-18  1294  		pr_err("queue %d: failed=
 to send icresp, error %d\n",
6e498960c93f88 Hannes Reinecke 2022-02-18  1295  		       nvme_tcp_queue_id=
(queue), ret);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1296  		goto free_icresp;
6e498960c93f88 Hannes Reinecke 2022-02-18  1297  	}
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1298  	pr_debug("queue %d: sent =
%d/%lu icreq bytes\n",
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1299  		 nvme_tcp_queue_id(queue=
), ret, iov.iov_len);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1300  	memset(&msg, 0, sizeof(ms=
g));
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1301  	msg.msg_control =3D cbuf;
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1302  	msg.msg_controllen =3D si=
zeof(cbuf);
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1303  	msg.msg_flags =3D MSG_WAI=
TALL;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1304  	iov.iov_base =3D icresp;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1305  	iov.iov_len =3D sizeof(*i=
cresp);
83859876ef6b6f Hannes Reinecke 2022-02-23  1306  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1307  	ret =3D kernel_recvmsg(qu=
eue->sock, &msg, &iov, 1,
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1308  			iov.iov_len, msg.msg_fl=
ags);
83859876ef6b6f Hannes Reinecke 2022-02-23  1309  	cmsg =3D (struct cmsghdr =
*)cbuf;
83859876ef6b6f Hannes Reinecke 2022-02-23  1310  	if (CMSG_OK(&msg, cmsg)) {
83859876ef6b6f Hannes Reinecke 2022-02-23  1311  		if (cmsg->cmsg_level =3D=
=3D SOL_TLS &&
83859876ef6b6f Hannes Reinecke 2022-02-23  1312  		    cmsg->cmsg_type =3D=
=3D TLS_GET_RECORD_TYPE) {
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1313  			pr_debug("queue %d: rec=
eived tls cmsg %d\n",
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1314  				 nvme_tcp_queue_id(que=
ue), cmsg->cmsg_type);
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1315  			ctype =3D *((unsigned c=
har *)CMSG_DATA(cmsg));
83859876ef6b6f Hannes Reinecke 2022-02-23  1316  			if (ctype =3D=3D TLS_RE=
CORD_TYPE_HANDSHAKE) {
83859876ef6b6f Hannes Reinecke 2022-02-23  1317  				u32 tls_hdr =3D get_un=
aligned_be32(iov.iov_base);
83859876ef6b6f Hannes Reinecke 2022-02-23 @1318  				u8 tls_hs_type =3D (tl=
s_hdr >> 24);
83859876ef6b6f Hannes Reinecke 2022-02-23  1319  				u32 tls_hs_len =3D (tl=
s_hdr & 0xFFFFFF);
83859876ef6b6f Hannes Reinecke 2022-02-23  1320  				pr_debug("queue %d: tl=
s handshake type %d len %u\n",
83859876ef6b6f Hannes Reinecke 2022-02-23  1321  					 nvme_tcp_queue_id(qu=
eue), tls_hs_type,
83859876ef6b6f Hannes Reinecke 2022-02-23  1322  					 tls_hs_len);
83859876ef6b6f Hannes Reinecke 2022-02-23  1323  				if (tls_hs_len > iov.i=
ov_len) {
83859876ef6b6f Hannes Reinecke 2022-02-23  1324  					tls_hs_len -=3D iov.i=
ov_len;
83859876ef6b6f Hannes Reinecke 2022-02-23  1325  					if (tls_hs_len > iov.=
iov_len)
83859876ef6b6f Hannes Reinecke 2022-02-23  1326  						iov.iov_len =3D size=
of(*icresp);
83859876ef6b6f Hannes Reinecke 2022-02-23  1327  					else
83859876ef6b6f Hannes Reinecke 2022-02-23  1328  						iov.iov_len =3D tls_=
hs_len;
83859876ef6b6f Hannes Reinecke 2022-02-23  1329  				} else
83859876ef6b6f Hannes Reinecke 2022-02-23  1330  					iov.iov_len =3D sizeo=
f(*icresp);
83859876ef6b6f Hannes Reinecke 2022-02-23  1331  				pr_debug("queue %d: re=
try %lu icresp bytes\n",
83859876ef6b6f Hannes Reinecke 2022-02-23  1332  					 nvme_tcp_queue_id(qu=
eue),
83859876ef6b6f Hannes Reinecke 2022-02-23  1333  					 iov.iov_len);
83859876ef6b6f Hannes Reinecke 2022-02-23  1334  				ret =3D -ENOTCONN;
83859876ef6b6f Hannes Reinecke 2022-02-23  1335  			} else if (ctype !=3D T=
LS_RECORD_TYPE_DATA) {
83859876ef6b6f Hannes Reinecke 2022-02-23  1336  				pr_debug("queue %d: sk=
ip tls record %d\n",
83859876ef6b6f Hannes Reinecke 2022-02-23  1337  					 nvme_tcp_queue_id(qu=
eue), ctype);
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1338  				ret =3D -ENOTCONN;
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1339  			}
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1340  		}
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1341  	}
6e498960c93f88 Hannes Reinecke 2022-02-18  1342  	if (ret < 0) {
6e498960c93f88 Hannes Reinecke 2022-02-18  1343  		pr_err("queue %d: failed=
 to receive icresp, error %d\n",
6e498960c93f88 Hannes Reinecke 2022-02-18  1344  		       nvme_tcp_queue_id=
(queue), ret);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1345  		goto free_icresp;
6e498960c93f88 Hannes Reinecke 2022-02-18  1346  	}
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1347  	pr_debug("queue %d: recei=
ved %d/%lu icresp bytes\n",
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1348  		 nvme_tcp_queue_id(queue=
), ret, iov.iov_len);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1349  	ret =3D -EINVAL;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1350  	if (icresp->hdr.type !=3D=
 nvme_tcp_icresp) {
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1351  		pr_err("queue %d: bad ty=
pe returned %d\n",
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1352  			nvme_tcp_queue_id(queue=
), icresp->hdr.type);
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1353  		print_hex_dump(KERN_ERR,=
 "icresp: ", 0,
96e2b9364c5e07 Hannes Reinecke 2022-02-22  1354  			       8, 1, icresp, io=
v.iov_len, true);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1355  		goto free_icresp;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1356  	}
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1357  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1358  	if (le32_to_cpu(icresp->h=
dr.plen) !=3D sizeof(*icresp)) {
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1359  		pr_err("queue %d: bad pd=
u length returned %d\n",
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1360  			nvme_tcp_queue_id(queue=
), icresp->hdr.plen);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1361  		goto free_icresp;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1362  	}
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1363  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1364  	if (icresp->pfv !=3D NVME=
_TCP_PFV_1_0) {
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1365  		pr_err("queue %d: bad pf=
v returned %d\n",
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1366  			nvme_tcp_queue_id(queue=
), icresp->pfv);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1367  		goto free_icresp;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1368  	}
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1369  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1370  	ctrl_ddgst =3D !!(icresp-=
>digest & NVME_TCP_DATA_DIGEST_ENABLE);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1371  	if ((queue->data_digest &=
& !ctrl_ddgst) ||
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1372  	    (!queue->data_digest =
&& ctrl_ddgst)) {
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1373  		pr_err("queue %d: data d=
igest mismatch host: %s ctrl: %s\n",
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1374  			nvme_tcp_queue_id(queue=
),
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1375  			queue->data_digest ? "e=
nabled" : "disabled",
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1376  			ctrl_ddgst ? "enabled" =
: "disabled");
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1377  		goto free_icresp;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1378  	}
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1379  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1380  	ctrl_hdgst =3D !!(icresp-=
>digest & NVME_TCP_HDR_DIGEST_ENABLE);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1381  	if ((queue->hdr_digest &&=
 !ctrl_hdgst) ||
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1382  	    (!queue->hdr_digest &=
& ctrl_hdgst)) {
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1383  		pr_err("queue %d: header=
 digest mismatch host: %s ctrl: %s\n",
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1384  			nvme_tcp_queue_id(queue=
),
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1385  			queue->hdr_digest ? "en=
abled" : "disabled",
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1386  			ctrl_hdgst ? "enabled" =
: "disabled");
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1387  		goto free_icresp;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1388  	}
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1389  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1390  	if (icresp->cpda !=3D 0) {
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1391  		pr_err("queue %d: unsupp=
orted cpda returned %d\n",
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1392  			nvme_tcp_queue_id(queue=
), icresp->cpda);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1393  		goto free_icresp;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1394  	}
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1395  =

3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1396  	ret =3D 0;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1397  free_icresp:
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1398  	kfree(icresp);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1399  free_icreq:
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1400  	kfree(icreq);
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1401  	return ret;
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1402  }
3f2304f8c6d6ed Sagi Grimberg   2018-12-03  1403  =


:::::: The code at line 1318 was first introduced by commit
:::::: 83859876ef6b6f754916508d69c7f628e0a3dbb4 nvme-tcp: fixup tls sendmsg=
()

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Hannes Reinecke <hare@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5036623270615383755==--

