Content-Type: multipart/mixed; boundary="===============3253102915925658893=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pinchartl-media:rpi/next/bcm2835-isp 5/49] drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:246:5: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Fri, 14 Jan 2022 16:22:12 +0800
Message-ID: <202201141631.O4sw00Gq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3253102915925658893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   git://linuxtv.org/pinchartl/media.git rpi/next/bcm2835-isp
head:   97975aa0732da0e2084ed69d140656c2162bec05
commit: 0cfa42bcc0795e569f1312e6ef5843c97bd36642 [5/49] staging: vc04_servi=
ces: Add new vc-sm-cma driver
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-c002-20220112 (https://download.01.org/0day-ci/archi=
ve/20220114/202201141631.O4sw00Gq-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media rpi/next/bcm2835-isp
        git checkout 0cfa42bcc0795e569f1312e6ef5843c97bd36642
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:177:3: note: Taking false branch
                   if (avg->avg_avl[i] =3D=3D val)
                   ^
   drivers/iio/humidity/hts221_core.c:176:36: note: The value 2 is assigned=
 to 'i'
           for (i =3D 0; i < HTS221_AVG_DEPTH; i++)
                                             ^~~
   drivers/iio/humidity/hts221_core.c:176:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < HTS221_AVG_DEPTH; i++)
           ^
   drivers/iio/humidity/hts221_core.c:177:7: note: Assuming the condition i=
s true
                   if (avg->avg_avl[i] =3D=3D val)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:177:3: note: Taking true branch
                   if (avg->avg_avl[i] =3D=3D val)
                   ^
   drivers/iio/humidity/hts221_core.c:178:4: note:  Execution continues on =
line 180
                           break;
                           ^
   drivers/iio/humidity/hts221_core.c:180:6: note: 'i' is not equal to HTS2=
21_AVG_DEPTH
           if (i =3D=3D HTS221_AVG_DEPTH)
               ^
   drivers/iio/humidity/hts221_core.c:180:2: note: Taking false branch
           if (i =3D=3D HTS221_AVG_DEPTH)
           ^
   drivers/iio/humidity/hts221_core.c:183:13: note: The result of the left =
shift is undefined due to shifting '2' by '31', which is unrepresentable in=
 the unsigned version of the return type 'int'
           data =3D ((i << __ffs(avg->mask)) & avg->mask);
                    ~ ^
   drivers/iio/humidity/hts221_core.c:183:13: warning: The result of the le=
ft shift is undefined due to shifting '3' by '31', which is unrepresentable=
 in the unsigned version of the return type 'int' [clang-analyzer-core.Unde=
finedBinaryOperatorResult]
           data =3D ((i << __ffs(avg->mask)) & avg->mask);
                      ^
   drivers/iio/humidity/hts221_core.c:486:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/humidity/hts221_core.c:486:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/humidity/hts221_core.c:489:2: note: Control jumps to 'case I=
IO_CHAN_INFO_OVERSAMPLING_RATIO:'  at line 493
           switch (mask) {
           ^
   drivers/iio/humidity/hts221_core.c:494:3: note: Control jumps to 'case I=
IO_TEMP:'  at line 498
                   switch (chan->type) {
                   ^
   drivers/iio/humidity/hts221_core.c:499:10: note: Calling 'hts221_update_=
avg'
                           ret =3D hts221_update_avg(hw, HTS221_SENSOR_T, v=
al);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:176:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < HTS221_AVG_DEPTH; i++)
           ^
   drivers/iio/humidity/hts221_core.c:177:7: note: Assuming the condition i=
s false
                   if (avg->avg_avl[i] =3D=3D val)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:177:3: note: Taking false branch
                   if (avg->avg_avl[i] =3D=3D val)
                   ^
   drivers/iio/humidity/hts221_core.c:176:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < HTS221_AVG_DEPTH; i++)
           ^
   drivers/iio/humidity/hts221_core.c:177:7: note: Assuming the condition i=
s false
                   if (avg->avg_avl[i] =3D=3D val)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:177:3: note: Taking false branch
                   if (avg->avg_avl[i] =3D=3D val)
                   ^
   drivers/iio/humidity/hts221_core.c:176:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < HTS221_AVG_DEPTH; i++)
           ^
   drivers/iio/humidity/hts221_core.c:177:7: note: Assuming the condition i=
s false
                   if (avg->avg_avl[i] =3D=3D val)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:177:3: note: Taking false branch
                   if (avg->avg_avl[i] =3D=3D val)
                   ^
   drivers/iio/humidity/hts221_core.c:176:36: note: The value 3 is assigned=
 to 'i'
           for (i =3D 0; i < HTS221_AVG_DEPTH; i++)
                                             ^~~
   drivers/iio/humidity/hts221_core.c:176:2: note: Loop condition is true. =
 Entering loop body
           for (i =3D 0; i < HTS221_AVG_DEPTH; i++)
           ^
   drivers/iio/humidity/hts221_core.c:177:7: note: Assuming the condition i=
s true
                   if (avg->avg_avl[i] =3D=3D val)
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/humidity/hts221_core.c:177:3: note: Taking true branch
                   if (avg->avg_avl[i] =3D=3D val)
                   ^
   drivers/iio/humidity/hts221_core.c:178:4: note:  Execution continues on =
line 180
                           break;
                           ^
   drivers/iio/humidity/hts221_core.c:180:6: note: 'i' is not equal to HTS2=
21_AVG_DEPTH
           if (i =3D=3D HTS221_AVG_DEPTH)
               ^
   drivers/iio/humidity/hts221_core.c:180:2: note: Taking false branch
           if (i =3D=3D HTS221_AVG_DEPTH)
           ^
   drivers/iio/humidity/hts221_core.c:183:13: note: The result of the left =
shift is undefined due to shifting '3' by '31', which is unrepresentable in=
 the unsigned version of the return type 'int'
           data =3D ((i << __ffs(avg->mask)) & avg->mask);
                    ~ ^
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:246:5: warning:=
 Use of memory after it is freed [clang-analyzer-unix.Malloc]
                                   vc_sm_cma_vchi_rx_ack(instance, cmd, rep=
ly,
                                   ^                               ~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:188:2: note: Lo=
op condition is true.  Entering loop body
           while (1) {
           ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:189:7: note: 's=
vc_use' is 1
                   if (svc_use)
                       ^~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:189:3: note: Ta=
king true branch
                   if (svc_use)
                   ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:193:7: note: As=
suming the condition is false
                   if (wait_for_completion_interruptible(&instance->io_cmpl=
t))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:193:3: note: Ta=
king false branch
                   if (wait_for_completion_interruptible(&instance->io_cmpl=
t))
                   ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:203:8: note: As=
suming the condition is false
                           if (list_empty(&instance->cmd_list)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:203:4: note: Ta=
king false branch
                           if (list_empty(&instance->cmd_list)) {
                           ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:217:8: note: As=
suming 'status' is 0
                           if (status) {
                               ^~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:217:4: note: Ta=
king false branch
                           if (status) {
                           ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:223:8: note: As=
suming field 'wait' is 0
                           if (!cmd->wait) {
                               ^~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:223:4: note: Ta=
king true branch
                           if (!cmd->wait) {
                           ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:227:5: note: Ca=
lling 'vc_vchi_cmd_delete'
                                   vc_vchi_cmd_delete(instance, cmd);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:138:6: note: As=
suming field 'alloc' is not equal to 0
           if (blk->alloc) {
               ^~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:138:2: note: Ta=
king true branch
           if (blk->alloc) {
           ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:139:3: note: Me=
mory is released
                   kfree(blk);
                   ^~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:227:5: note: Re=
turning; memory was released via 2nd parameter
                                   vc_vchi_cmd_delete(instance, cmd);
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:228:5: note:  E=
xecution continues on line 236
                                   continue;
                                   ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:198:3: note: Lo=
op condition is true. Execution continues on line 202
                   do {
                   ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:203:8: note: As=
suming the condition is true
                           if (list_empty(&instance->cmd_list)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:203:4: note: Ta=
king true branch
                           if (list_empty(&instance->cmd_list)) {
                           ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:206:5: note:  E=
xecution continues on line 238
                                   break;
                                   ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:238:3: note: Lo=
op condition is true.  Entering loop body
                   while ((header =3D vchiq_msg_hold(instance->service_hand=
le[0]))) {
                   ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:240:8: note: As=
suming the condition is false
                           if (reply->trans_id & 0x80000000) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:240:4: note: Ta=
king false branch
                           if (reply->trans_id & 0x80000000) {
                           ^
   drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c:246:5: note: Us=
e of memory after it is freed
                                   vc_sm_cma_vchi_rx_ack(instance, cmd, rep=
ly,
                                   ^                               ~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/media/usb/stk1160/stk1160-video.c:31:3: warning: Value stored to=
 'errmsg' is never read [clang-analyzer-deadcode.DeadStores]
                   errmsg =3D "unlinked synchronously";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/stk1160/stk1160-video.c:31:3: note: Value stored to 'e=
rrmsg' is never read
                   errmsg =3D "unlinked synchronously";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/stk1160/stk1160-video.c:34:3: warning: Value stored to=
 'errmsg' is never read [clang-analyzer-deadcode.DeadStores]
                   errmsg =3D "unlinked asynchronously";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/stk1160/stk1160-video.c:34:3: note: Value stored to 'e=
rrmsg' is never read
                   errmsg =3D "unlinked asynchronously";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/stk1160/stk1160-video.c:37:3: warning: Value stored to=
 'errmsg' is never read [clang-analyzer-deadcode.DeadStores]
                   errmsg =3D "Buffer error (overrun)";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/stk1160/stk1160-video.c:37:3: note: Value stored to 'e=
rrmsg' is never read
                   errmsg =3D "Buffer error (overrun)";
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/usb/stk1160/stk1160-video.c:40:3: warning: Value stored to=
 'errmsg' is never read [clang-analyzer-deadcode.DeadStores]
                   errmsg =3D "Stalled (device not responding)";

vim +246 drivers/staging/vc04_services/vc-sm-cma/vc_sm_cma_vchi.c

0cfa42bcc0795e Dave Stevenson 2020-10-08  178  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  179  static int vc_sm_cma_vchi_vi=
deocore_io(void *arg)
0cfa42bcc0795e Dave Stevenson 2020-10-08  180  {
0cfa42bcc0795e Dave Stevenson 2020-10-08  181  	struct sm_instance *instanc=
e =3D arg;
0cfa42bcc0795e Dave Stevenson 2020-10-08  182  	struct sm_cmd_rsp_blk *cmd =
=3D NULL, *cmd_tmp;
0cfa42bcc0795e Dave Stevenson 2020-10-08  183  	struct vc_sm_result_t *repl=
y;
0cfa42bcc0795e Dave Stevenson 2020-10-08  184  	struct vchiq_header *header;
0cfa42bcc0795e Dave Stevenson 2020-10-08  185  	s32 status;
0cfa42bcc0795e Dave Stevenson 2020-10-08  186  	int svc_use =3D 1;
0cfa42bcc0795e Dave Stevenson 2020-10-08  187  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  188  	while (1) {
0cfa42bcc0795e Dave Stevenson 2020-10-08  189  		if (svc_use)
0cfa42bcc0795e Dave Stevenson 2020-10-08  190  			vchiq_release_service(ins=
tance->service_handle[0]);
0cfa42bcc0795e Dave Stevenson 2020-10-08  191  		svc_use =3D 0;
0cfa42bcc0795e Dave Stevenson 2020-10-08  192  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  193  		if (wait_for_completion_in=
terruptible(&instance->io_cmplt))
0cfa42bcc0795e Dave Stevenson 2020-10-08  194  			continue;
0cfa42bcc0795e Dave Stevenson 2020-10-08  195  		vchiq_use_service(instance=
->service_handle[0]);
0cfa42bcc0795e Dave Stevenson 2020-10-08  196  		svc_use =3D 1;
0cfa42bcc0795e Dave Stevenson 2020-10-08  197  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  198  		do {
0cfa42bcc0795e Dave Stevenson 2020-10-08  199  			/*
0cfa42bcc0795e Dave Stevenson 2020-10-08  200  			 * Get new command and mo=
ve it to response list
0cfa42bcc0795e Dave Stevenson 2020-10-08  201  			 */
0cfa42bcc0795e Dave Stevenson 2020-10-08  202  			mutex_lock(&instance->loc=
k);
0cfa42bcc0795e Dave Stevenson 2020-10-08  203  			if (list_empty(&instance-=
>cmd_list)) {
0cfa42bcc0795e Dave Stevenson 2020-10-08  204  				/* no more commands to p=
rocess */
0cfa42bcc0795e Dave Stevenson 2020-10-08  205  				mutex_unlock(&instance->=
lock);
0cfa42bcc0795e Dave Stevenson 2020-10-08  206  				break;
0cfa42bcc0795e Dave Stevenson 2020-10-08  207  			}
0cfa42bcc0795e Dave Stevenson 2020-10-08  208  			cmd =3D list_first_entry(=
&instance->cmd_list,
0cfa42bcc0795e Dave Stevenson 2020-10-08  209  					       struct sm_cmd_rs=
p_blk, head);
0cfa42bcc0795e Dave Stevenson 2020-10-08  210  			list_move(&cmd->head, &in=
stance->rsp_list);
0cfa42bcc0795e Dave Stevenson 2020-10-08  211  			cmd->sent =3D 1;
0cfa42bcc0795e Dave Stevenson 2020-10-08  212  			mutex_unlock(&instance->l=
ock);
0cfa42bcc0795e Dave Stevenson 2020-10-08  213  			/* Send the command */
0cfa42bcc0795e Dave Stevenson 2020-10-08  214  			status =3D
0cfa42bcc0795e Dave Stevenson 2020-10-08  215  				bcm2835_vchi_msg_queue(i=
nstance->service_handle[0],
0cfa42bcc0795e Dave Stevenson 2020-10-08  216  						       cmd->msg, cmd->=
length);
0cfa42bcc0795e Dave Stevenson 2020-10-08  217  			if (status) {
0cfa42bcc0795e Dave Stevenson 2020-10-08  218  				pr_err("%s: failed to qu=
eue message (%d)",
0cfa42bcc0795e Dave Stevenson 2020-10-08  219  				       __func__, status);
0cfa42bcc0795e Dave Stevenson 2020-10-08  220  			}
0cfa42bcc0795e Dave Stevenson 2020-10-08  221  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  222  			/* If no reply is needed =
then we're done */
0cfa42bcc0795e Dave Stevenson 2020-10-08  223  			if (!cmd->wait) {
0cfa42bcc0795e Dave Stevenson 2020-10-08  224  				mutex_lock(&instance->lo=
ck);
0cfa42bcc0795e Dave Stevenson 2020-10-08  225  				list_del(&cmd->head);
0cfa42bcc0795e Dave Stevenson 2020-10-08  226  				mutex_unlock(&instance->=
lock);
0cfa42bcc0795e Dave Stevenson 2020-10-08  227  				vc_vchi_cmd_delete(insta=
nce, cmd);
0cfa42bcc0795e Dave Stevenson 2020-10-08  228  				continue;
0cfa42bcc0795e Dave Stevenson 2020-10-08  229  			}
0cfa42bcc0795e Dave Stevenson 2020-10-08  230  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  231  			if (status) {
0cfa42bcc0795e Dave Stevenson 2020-10-08  232  				complete(&cmd->cmplt);
0cfa42bcc0795e Dave Stevenson 2020-10-08  233  				continue;
0cfa42bcc0795e Dave Stevenson 2020-10-08  234  			}
0cfa42bcc0795e Dave Stevenson 2020-10-08  235  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  236  		} while (1);
0cfa42bcc0795e Dave Stevenson 2020-10-08  237  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  238  		while ((header =3D vchiq_m=
sg_hold(instance->service_handle[0]))) {
0cfa42bcc0795e Dave Stevenson 2020-10-08  239  			reply =3D (struct vc_sm_r=
esult_t *)header->data;
0cfa42bcc0795e Dave Stevenson 2020-10-08  240  			if (reply->trans_id & 0x8=
0000000) {
0cfa42bcc0795e Dave Stevenson 2020-10-08  241  				/* Async event or cmd fr=
om the VPU */
0cfa42bcc0795e Dave Stevenson 2020-10-08  242  				if (instance->vpu_event)
0cfa42bcc0795e Dave Stevenson 2020-10-08  243  					instance->vpu_event(ins=
tance, reply,
0cfa42bcc0795e Dave Stevenson 2020-10-08  244  							    header->size);
0cfa42bcc0795e Dave Stevenson 2020-10-08  245  			} else {
0cfa42bcc0795e Dave Stevenson 2020-10-08 @246  				vc_sm_cma_vchi_rx_ack(in=
stance, cmd, reply,
0cfa42bcc0795e Dave Stevenson 2020-10-08  247  						      header->size);
0cfa42bcc0795e Dave Stevenson 2020-10-08  248  			}
0cfa42bcc0795e Dave Stevenson 2020-10-08  249  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  250  			vchiq_release_message(ins=
tance->service_handle[0],
0cfa42bcc0795e Dave Stevenson 2020-10-08  251  					      header);
0cfa42bcc0795e Dave Stevenson 2020-10-08  252  		}
0cfa42bcc0795e Dave Stevenson 2020-10-08  253  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  254  		/* Go through the dead lis=
t and free them */
0cfa42bcc0795e Dave Stevenson 2020-10-08  255  		mutex_lock(&instance->lock=
);
0cfa42bcc0795e Dave Stevenson 2020-10-08  256  		list_for_each_entry_safe(c=
md, cmd_tmp, &instance->dead_list,
0cfa42bcc0795e Dave Stevenson 2020-10-08  257  					 head) {
0cfa42bcc0795e Dave Stevenson 2020-10-08  258  			list_del(&cmd->head);
0cfa42bcc0795e Dave Stevenson 2020-10-08  259  			vc_vchi_cmd_delete(instan=
ce, cmd);
0cfa42bcc0795e Dave Stevenson 2020-10-08  260  		}
0cfa42bcc0795e Dave Stevenson 2020-10-08  261  		mutex_unlock(&instance->lo=
ck);
0cfa42bcc0795e Dave Stevenson 2020-10-08  262  	}
0cfa42bcc0795e Dave Stevenson 2020-10-08  263  =

0cfa42bcc0795e Dave Stevenson 2020-10-08  264  	return 0;
0cfa42bcc0795e Dave Stevenson 2020-10-08  265  }
0cfa42bcc0795e Dave Stevenson 2020-10-08  266  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3253102915925658893==--

