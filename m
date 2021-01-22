Content-Type: multipart/mixed; boundary="===============6245505776032880395=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [freescale-fslc:pr/78 283/3687] include/linux/blk-mq.h:271:36: sparse: sparse: bad constant expression type
Date: Fri, 22 Jan 2021 11:50:41 +0800
Message-ID: <202101221134.1JeJSImG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6245505776032880395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc pr/78
head:   35b10ca99cd3cb57e545010466bbd588987c96f6
commit: 0196856db2fe33b0ffd413bd5e01a9bd31c110da [283/3687] i2c: imx: imple=
ment bus recovery with gpio for Layerscape
:::::: branch date: 8 months ago
:::::: commit date: 8 months ago
config: arm-randconfig-s032-20210122 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        # https://github.com/Freescale/linux-fslc/commit/0196856db2fe33b0ff=
d413bd5e01a9bd31c110da
        git remote add freescale-fslc https://github.com/Freescale/linux-fs=
lc
        git fetch --no-tags freescale-fslc pr/78
        git checkout 0196856db2fe33b0ffd413bd5e01a9bd31c110da
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darm =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/i2c/busses/i2c-imx.c: note: in included file (through include/sc=
si/scsi_host.h, include/linux/libata.h):
   include/linux/blk-mq.h:123:35: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/blk-mq.h:123:35: sparse: sparse: got (
   include/linux/blk-mq.h:150:33: sparse: sparse: expected ; at end of decl=
aration
   include/linux/blk-mq.h:150:33: sparse: sparse: Expected } at end of spec=
ifier
   include/linux/blk-mq.h:150:33: sparse: sparse: got *
   include/linux/blk-mq.h:224:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/blk-mq.h:224:1: sparse: sparse: got }
   include/linux/blk-mq.h:271:44: sparse: sparse: Expected ) at end of cast=
 operator
   include/linux/blk-mq.h:271:44: sparse: sparse: got blk_mq_req_flags_t
>> include/linux/blk-mq.h:271:36: sparse: sparse: bad constant expression t=
ype
   include/linux/blk-mq.h:281:36: sparse: sparse: Expected ) in function de=
clarator
   include/linux/blk-mq.h:281:36: sparse: sparse: got flags
   include/linux/blk-mq.h:283:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/blk-mq.h:283:53: sparse: sparse: got flags
   include/linux/blk-mq.h:367:24: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/blk-mq.h:367:24: sparse: sparse: got request_to_qc_t
>> include/linux/blk-mq.h:373:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/blk-mq.h:373:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/blk-mq.h:373:16: sparse: sparse: got rq
   include/linux/blk-mq.h:375:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/blk-mq.h:375:1: sparse: sparse: got }
   include/linux/blk-mq.h:381:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/blk-mq.h:381:1: sparse: sparse: got }
   drivers/i2c/busses/i2c-imx.c: note: in included file (through include/sc=
si/scsi_common.h, include/scsi/scsi.h, include/scsi/scsi_host.h, ...):
   include/scsi/scsi_proto.h:187:1: sparse: sparse: Expected ; at the end o=
f type declaration
   include/scsi/scsi_proto.h:187:1: sparse: sparse: got }
   drivers/i2c/busses/i2c-imx.c: note: in included file (through include/sc=
si/scsi_host.h, include/linux/libata.h):
   include/linux/blk-mq.h:180:33: sparse: sparse: symbol 'complete' redecla=
red with different type (different base types):
>> include/linux/blk-mq.h:180:33: sparse:    void ( [usertype] *[addressabl=
e] [toplevel] complete )( ... )
   drivers/i2c/busses/i2c-imx.c: note: in included file (through include/li=
nux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/completion.h:118:13: sparse: note: previously declared as:
>> include/linux/completion.h:118:13: sparse:    void extern [addressable] =
[toplevel] complete( ... )

vim +271 include/linux/blk-mq.h

05229beeddf7e75e Jens Axboe        2015-11-05  144  =

81481eb423c295c5 Christoph Hellwig 2014-09-13  145  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  146  struct blk_mq_ops {
320ae51feed5c2f1 Jens Axboe        2013-10-24  147  	/*
320ae51feed5c2f1 Jens Axboe        2013-10-24  148  	 * Queue request
320ae51feed5c2f1 Jens Axboe        2013-10-24  149  	 */
320ae51feed5c2f1 Jens Axboe        2013-10-24  150  	queue_rq_fn		*queue_rq;
320ae51feed5c2f1 Jens Axboe        2013-10-24  151  =

d666ba98f849ad44 Jens Axboe        2018-11-27  152  	/*
d666ba98f849ad44 Jens Axboe        2018-11-27  153  	 * If a driver uses bd=
->last to judge when to submit requests to
d666ba98f849ad44 Jens Axboe        2018-11-27  154  	 * hardware, it must d=
efine this function. In case of errors that
d666ba98f849ad44 Jens Axboe        2018-11-27  155  	 * make us stop issuin=
g further requests, this hook serves the
d666ba98f849ad44 Jens Axboe        2018-11-27  156  	 * purpose of kicking =
the hardware (which the last request otherwise
d666ba98f849ad44 Jens Axboe        2018-11-27  157  	 * would have done).
d666ba98f849ad44 Jens Axboe        2018-11-27  158  	 */
d666ba98f849ad44 Jens Axboe        2018-11-27  159  	commit_rqs_fn		*commit=
_rqs;
d666ba98f849ad44 Jens Axboe        2018-11-27  160  =

de1482974080ec9e Ming Lei          2017-10-14  161  	/*
de1482974080ec9e Ming Lei          2017-10-14  162  	 * Reserve budget befo=
re queue request, once .queue_rq is
de1482974080ec9e Ming Lei          2017-10-14  163  	 * run, it is driver's=
 responsibility to release the
de1482974080ec9e Ming Lei          2017-10-14  164  	 * reserved budget. Al=
so we have to handle failure case
de1482974080ec9e Ming Lei          2017-10-14  165  	 * of .get_budget for =
avoiding I/O deadlock.
de1482974080ec9e Ming Lei          2017-10-14  166  	 */
de1482974080ec9e Ming Lei          2017-10-14  167  	get_budget_fn		*get_bu=
dget;
de1482974080ec9e Ming Lei          2017-10-14  168  	put_budget_fn		*put_bu=
dget;
de1482974080ec9e Ming Lei          2017-10-14  169  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  170  	/*
320ae51feed5c2f1 Jens Axboe        2013-10-24  171  	 * Called on request t=
imeout
320ae51feed5c2f1 Jens Axboe        2013-10-24  172  	 */
0152fb6b57c4fae7 Christoph Hellwig 2014-09-13  173  	timeout_fn		*timeout;
320ae51feed5c2f1 Jens Axboe        2013-10-24  174  =

05229beeddf7e75e Jens Axboe        2015-11-05  175  	/*
05229beeddf7e75e Jens Axboe        2015-11-05  176  	 * Called to poll for =
completion of a specific tag.
05229beeddf7e75e Jens Axboe        2015-11-05  177  	 */
05229beeddf7e75e Jens Axboe        2015-11-05  178  	poll_fn			*poll;
05229beeddf7e75e Jens Axboe        2015-11-05  179  =

c7bb9ad1744ea14e Jens Axboe        2018-10-31 @180  	complete_fn		*complete;
30a91cb4ef385fe1 Christoph Hellwig 2014-02-10  181  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  182  	/*
320ae51feed5c2f1 Jens Axboe        2013-10-24  183  	 * Called when the blo=
ck layer side of a hardware queue has been
320ae51feed5c2f1 Jens Axboe        2013-10-24  184  	 * set up, allowing th=
e driver to allocate/init matching structures.
320ae51feed5c2f1 Jens Axboe        2013-10-24  185  	 * Ditto for exit/tear=
down.
320ae51feed5c2f1 Jens Axboe        2013-10-24  186  	 */
320ae51feed5c2f1 Jens Axboe        2013-10-24  187  	init_hctx_fn		*init_hc=
tx;
320ae51feed5c2f1 Jens Axboe        2013-10-24  188  	exit_hctx_fn		*exit_hc=
tx;
e9b267d91f6ddbc6 Christoph Hellwig 2014-04-15  189  =

e9b267d91f6ddbc6 Christoph Hellwig 2014-04-15  190  	/*
e9b267d91f6ddbc6 Christoph Hellwig 2014-04-15  191  	 * Called for every co=
mmand allocated by the block layer to allow
e9b267d91f6ddbc6 Christoph Hellwig 2014-04-15  192  	 * the driver to set u=
p driver specific data.
f70ced09170761ac Ming Lei          2014-09-25  193  	 *
f70ced09170761ac Ming Lei          2014-09-25  194  	 * Tag greater than or=
 equal to queue_depth is for setting up
f70ced09170761ac Ming Lei          2014-09-25  195  	 * flush request.
f70ced09170761ac Ming Lei          2014-09-25  196  	 *
e9b267d91f6ddbc6 Christoph Hellwig 2014-04-15  197  	 * Ditto for exit/tear=
down.
e9b267d91f6ddbc6 Christoph Hellwig 2014-04-15  198  	 */
e9b267d91f6ddbc6 Christoph Hellwig 2014-04-15  199  	init_request_fn		*init=
_request;
e9b267d91f6ddbc6 Christoph Hellwig 2014-04-15  200  	exit_request_fn		*exit=
_request;
d280bab305431c18 Bart Van Assche   2017-06-20  201  	/* Called from inside =
blk_get_request() */
d280bab305431c18 Bart Van Assche   2017-06-20  202  	void (*initialize_rq_f=
n)(struct request *rq);
da695ba236b993f0 Christoph Hellwig 2016-09-14  203  =

226b4fc75c78f9c4 Ming Lei          2019-07-25  204  	/*
226b4fc75c78f9c4 Ming Lei          2019-07-25  205  	 * Called before freei=
ng one request which isn't completed yet,
226b4fc75c78f9c4 Ming Lei          2019-07-25  206  	 * and usually for fre=
eing the driver private data
226b4fc75c78f9c4 Ming Lei          2019-07-25  207  	 */
226b4fc75c78f9c4 Ming Lei          2019-07-25  208  	cleanup_rq_fn		*cleanu=
p_rq;
226b4fc75c78f9c4 Ming Lei          2019-07-25  209  =

9ba20527f4d1430b Jens Axboe        2018-10-29  210  	/*
9ba20527f4d1430b Jens Axboe        2018-10-29  211  	 * If set, returns whe=
ther or not this queue currently is busy
9ba20527f4d1430b Jens Axboe        2018-10-29  212  	 */
9ba20527f4d1430b Jens Axboe        2018-10-29  213  	busy_fn			*busy;
9ba20527f4d1430b Jens Axboe        2018-10-29  214  =

da695ba236b993f0 Christoph Hellwig 2016-09-14  215  	map_queues_fn		*map_qu=
eues;
2836ee4b1acbe7b3 Bart Van Assche   2017-04-26  216  =

2836ee4b1acbe7b3 Bart Van Assche   2017-04-26  217  #ifdef CONFIG_BLK_DEBUG=
_FS
2836ee4b1acbe7b3 Bart Van Assche   2017-04-26  218  	/*
2836ee4b1acbe7b3 Bart Van Assche   2017-04-26  219  	 * Used by the debugfs=
 implementation to show driver-specific
2836ee4b1acbe7b3 Bart Van Assche   2017-04-26  220  	 * information about a=
 request.
2836ee4b1acbe7b3 Bart Van Assche   2017-04-26  221  	 */
2836ee4b1acbe7b3 Bart Van Assche   2017-04-26  222  	void (*show_rq)(struct=
 seq_file *m, struct request *rq);
2836ee4b1acbe7b3 Bart Van Assche   2017-04-26  223  #endif
320ae51feed5c2f1 Jens Axboe        2013-10-24  224  };
320ae51feed5c2f1 Jens Axboe        2013-10-24  225  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  226  enum {
320ae51feed5c2f1 Jens Axboe        2013-10-24  227  	BLK_MQ_F_SHOULD_MERGE	=
=3D 1 << 0,
8a58d1f1f373238c Jens Axboe        2014-08-15  228  	BLK_MQ_F_TAG_SHARED	=
=3D 1 << 1,
1b792f2f92784c00 Jens Axboe        2016-09-21  229  	BLK_MQ_F_BLOCKING	=3D =
1 << 5,
d34849913819a5e0 Jens Axboe        2017-01-13  230  	BLK_MQ_F_NO_SCHED	=3D =
1 << 6,
24391c0dc57c3756 Shaohua Li        2015-01-23  231  	BLK_MQ_F_ALLOC_POLICY_=
START_BIT =3D 8,
24391c0dc57c3756 Shaohua Li        2015-01-23  232  	BLK_MQ_F_ALLOC_POLICY_=
BITS =3D 1,
320ae51feed5c2f1 Jens Axboe        2013-10-24  233  =

5d12f905cc50c081 Jens Axboe        2014-03-19  234  	BLK_MQ_S_STOPPED	=3D 0,
0d2602ca30e410e8 Jens Axboe        2014-05-13  235  	BLK_MQ_S_TAG_ACTIVE	=
=3D 1,
bd166ef183c263c5 Jens Axboe        2017-01-17  236  	BLK_MQ_S_SCHED_RESTART=
	=3D 2,
320ae51feed5c2f1 Jens Axboe        2013-10-24  237  =

a4391c6465d9c978 Jens Axboe        2014-06-05  238  	BLK_MQ_MAX_DEPTH	=3D 1=
0240,
506e931f92defdc6 Jens Axboe        2014-05-07  239  =

506e931f92defdc6 Jens Axboe        2014-05-07  240  	BLK_MQ_CPU_WORK_BATCH	=
=3D 8,
320ae51feed5c2f1 Jens Axboe        2013-10-24  241  };
24391c0dc57c3756 Shaohua Li        2015-01-23  242  #define BLK_MQ_FLAG_TO_=
ALLOC_POLICY(flags) \
24391c0dc57c3756 Shaohua Li        2015-01-23  243  	((flags >> BLK_MQ_F_AL=
LOC_POLICY_START_BIT) & \
24391c0dc57c3756 Shaohua Li        2015-01-23  244  		((1 << BLK_MQ_F_ALLOC=
_POLICY_BITS) - 1))
24391c0dc57c3756 Shaohua Li        2015-01-23  245  #define BLK_ALLOC_POLIC=
Y_TO_MQ_FLAG(policy) \
24391c0dc57c3756 Shaohua Li        2015-01-23  246  	((policy & ((1 << BLK_=
MQ_F_ALLOC_POLICY_BITS) - 1)) \
24391c0dc57c3756 Shaohua Li        2015-01-23  247  		<< BLK_MQ_F_ALLOC_POL=
ICY_START_BIT)
320ae51feed5c2f1 Jens Axboe        2013-10-24  248  =

24d2f90309b23f2c Christoph Hellwig 2014-04-15  249  struct request_queue *b=
lk_mq_init_queue(struct blk_mq_tag_set *);
b62c21b71f08b7a4 Mike Snitzer      2015-03-12  250  struct request_queue *b=
lk_mq_init_allocated_queue(struct blk_mq_tag_set *set,
737eb78e82d52d35 Damien Le Moal    2019-09-05  251  						  struct request_=
queue *q,
737eb78e82d52d35 Damien Le Moal    2019-09-05  252  						  bool elevator_i=
nit);
9316a9ed6895c4ad Jens Axboe        2018-10-15  253  struct request_queue *b=
lk_mq_init_sq_queue(struct blk_mq_tag_set *set,
9316a9ed6895c4ad Jens Axboe        2018-10-15  254  						const struct blk_=
mq_ops *ops,
9316a9ed6895c4ad Jens Axboe        2018-10-15  255  						unsigned int queu=
e_depth,
9316a9ed6895c4ad Jens Axboe        2018-10-15  256  						unsigned int set_=
flags);
b21d5b301794ae33 Matias Bj=C3=B8rling   2016-09-16  257  void blk_mq_unregi=
ster_dev(struct device *, struct request_queue *);
320ae51feed5c2f1 Jens Axboe        2013-10-24  258  =

24d2f90309b23f2c Christoph Hellwig 2014-04-15  259  int blk_mq_alloc_tag_se=
t(struct blk_mq_tag_set *set);
24d2f90309b23f2c Christoph Hellwig 2014-04-15  260  void blk_mq_free_tag_se=
t(struct blk_mq_tag_set *set);
24d2f90309b23f2c Christoph Hellwig 2014-04-15  261  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  262  void blk_mq_flush_plug_=
list(struct blk_plug *plug, bool from_schedule);
320ae51feed5c2f1 Jens Axboe        2013-10-24  263  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  264  void blk_mq_free_reques=
t(struct request *rq);
320ae51feed5c2f1 Jens Axboe        2013-10-24  265  bool blk_mq_can_queue(s=
truct blk_mq_hw_ctx *);
6f3b0e8bcf3cbb87 Christoph Hellwig 2015-11-26  266  =

3c94d83cb352627f Jens Axboe        2018-12-17  267  bool blk_mq_queue_infli=
ght(struct request_queue *q);
ae8799125d565c79 Jens Axboe        2018-11-08  268  =

6f3b0e8bcf3cbb87 Christoph Hellwig 2015-11-26  269  enum {
9a95e4ef709533ef Bart Van Assche   2017-11-09  270  	/* return when out of =
requests */
9a95e4ef709533ef Bart Van Assche   2017-11-09 @271  	BLK_MQ_REQ_NOWAIT	=3D =
(__force blk_mq_req_flags_t)(1 << 0),
9a95e4ef709533ef Bart Van Assche   2017-11-09  272  	/* allocate from reser=
ved pool */
9a95e4ef709533ef Bart Van Assche   2017-11-09  273  	BLK_MQ_REQ_RESERVED	=
=3D (__force blk_mq_req_flags_t)(1 << 1),
9a95e4ef709533ef Bart Van Assche   2017-11-09  274  	/* allocate internal/s=
ched tag */
9a95e4ef709533ef Bart Van Assche   2017-11-09  275  	BLK_MQ_REQ_INTERNAL	=
=3D (__force blk_mq_req_flags_t)(1 << 2),
9a95e4ef709533ef Bart Van Assche   2017-11-09  276  	/* set RQF_PREEMPT */
9a95e4ef709533ef Bart Van Assche   2017-11-09  277  	BLK_MQ_REQ_PREEMPT	=3D=
 (__force blk_mq_req_flags_t)(1 << 3),
6f3b0e8bcf3cbb87 Christoph Hellwig 2015-11-26  278  };
6f3b0e8bcf3cbb87 Christoph Hellwig 2015-11-26  279  =

cd6ce1482fd9e691 Bart Van Assche   2017-06-20  280  struct request *blk_mq_=
alloc_request(struct request_queue *q, unsigned int op,
9a95e4ef709533ef Bart Van Assche   2017-11-09  281  		blk_mq_req_flags_t fl=
ags);
cd6ce1482fd9e691 Bart Van Assche   2017-06-20  282  struct request *blk_mq_=
alloc_request_hctx(struct request_queue *q,
9a95e4ef709533ef Bart Van Assche   2017-11-09  283  		unsigned int op, blk_=
mq_req_flags_t flags,
9a95e4ef709533ef Bart Van Assche   2017-11-09  284  		unsigned int hctx_idx=
);
0e62f51f8753b048 Jens Axboe        2014-06-04  285  struct request *blk_mq_=
tag_to_rq(struct blk_mq_tags *tags, unsigned int tag);
320ae51feed5c2f1 Jens Axboe        2013-10-24  286  =

205fb5f5ba1d8edc Bart Van Assche   2014-10-30  287  enum {
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  288  	BLK_MQ_UNIQUE_TAG_BITS=
 =3D 16,
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  289  	BLK_MQ_UNIQUE_TAG_MASK=
 =3D (1 << BLK_MQ_UNIQUE_TAG_BITS) - 1,
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  290  };
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  291  =

205fb5f5ba1d8edc Bart Van Assche   2014-10-30  292  u32 blk_mq_unique_tag(s=
truct request *rq);
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  293  =

205fb5f5ba1d8edc Bart Van Assche   2014-10-30  294  static inline u16 blk_m=
q_unique_tag_to_hwq(u32 unique_tag)
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  295  {
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  296  	return unique_tag >> B=
LK_MQ_UNIQUE_TAG_BITS;
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  297  }
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  298  =

205fb5f5ba1d8edc Bart Van Assche   2014-10-30  299  static inline u16 blk_m=
q_unique_tag_to_tag(u32 unique_tag)
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  300  {
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  301  	return unique_tag & BL=
K_MQ_UNIQUE_TAG_MASK;
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  302  }
205fb5f5ba1d8edc Bart Van Assche   2014-10-30  303  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  304  =

973c01919bce7e35 Keith Busch       2015-01-07  305  int blk_mq_request_star=
ted(struct request *rq);
aa306ab703e9452b Ming Lei          2019-07-24  306  int blk_mq_request_comp=
leted(struct request *rq);
e2490073cd7c3d6f Christoph Hellwig 2014-09-13  307  void blk_mq_start_reque=
st(struct request *rq);
2a842acab109f40f Christoph Hellwig 2017-06-03  308  void blk_mq_end_request=
(struct request *rq, blk_status_t error);
2a842acab109f40f Christoph Hellwig 2017-06-03  309  void __blk_mq_end_reque=
st(struct request *rq, blk_status_t error);
320ae51feed5c2f1 Jens Axboe        2013-10-24  310  =

2b053aca76b48e68 Bart Van Assche   2016-10-28  311  void blk_mq_requeue_req=
uest(struct request *rq, bool kick_requeue_list);
6fca6a611c27f1f0 Christoph Hellwig 2014-05-28  312  void blk_mq_kick_requeu=
e_list(struct request_queue *q);
2849450ad39d2e69 Mike Snitzer      2016-09-14  313  void blk_mq_delay_kick_=
requeue_list(struct request_queue *q, unsigned long msecs);
16c15eb16a793f2d Keith Busch       2018-11-26  314  bool blk_mq_complete_re=
quest(struct request *rq);
9c5587346490ad43 Jens Axboe        2018-05-30  315  bool blk_mq_bio_list_me=
rge(struct request_queue *q, struct list_head *list,
14ccb66b3f585b2b Christoph Hellwig 2019-06-06  316  			   struct bio *bio, =
unsigned int nr_segs);
fd00144301d64f17 Bart Van Assche   2016-10-28  317  bool blk_mq_queue_stopp=
ed(struct request_queue *q);
320ae51feed5c2f1 Jens Axboe        2013-10-24  318  void blk_mq_stop_hw_que=
ue(struct blk_mq_hw_ctx *hctx);
320ae51feed5c2f1 Jens Axboe        2013-10-24  319  void blk_mq_start_hw_qu=
eue(struct blk_mq_hw_ctx *hctx);
280d45f6c35d8d7a Christoph Hellwig 2013-10-25  320  void blk_mq_stop_hw_que=
ues(struct request_queue *q);
2f268556567ebeb3 Christoph Hellwig 2014-04-16  321  void blk_mq_start_hw_qu=
eues(struct request_queue *q);
ae911c5e796d51cb Jens Axboe        2016-12-08  322  void blk_mq_start_stopp=
ed_hw_queue(struct blk_mq_hw_ctx *hctx, bool async);
1b4a325858f695a9 Christoph Hellwig 2014-04-16  323  void blk_mq_start_stopp=
ed_hw_queues(struct request_queue *q, bool async);
97e0120990f4a703 Ming Lei          2017-06-06  324  void blk_mq_quiesce_que=
ue(struct request_queue *q);
e4e739131ac93d37 Ming Lei          2017-06-06  325  void blk_mq_unquiesce_q=
ueue(struct request_queue *q);
7587a5ae7eef0439 Bart Van Assche   2017-04-07  326  void blk_mq_delay_run_h=
w_queue(struct blk_mq_hw_ctx *hctx, unsigned long msecs);
79f720a751cad613 Jens Axboe        2017-11-10  327  bool blk_mq_run_hw_queu=
e(struct blk_mq_hw_ctx *hctx, bool async);
b94ec296403e99d5 Mike Snitzer      2015-03-11  328  void blk_mq_run_hw_queu=
es(struct request_queue *q, bool async);
e0489487ec9cd79e Sagi Grimberg     2016-03-10  329  void blk_mq_tagset_busy=
_iter(struct blk_mq_tag_set *tagset,
e0489487ec9cd79e Sagi Grimberg     2016-03-10  330  		busy_tag_iter_fn *fn,=
 void *priv);
f9934a80f91dba8c Ming Lei          2019-07-24  331  void blk_mq_tagset_wait=
_completed_request(struct blk_mq_tag_set *tagset);
c761d96b079e99d1 Jens Axboe        2015-01-02  332  void blk_mq_freeze_queu=
e(struct request_queue *q);
b4c6a028774bcf3f Keith Busch       2014-12-19  333  void blk_mq_unfreeze_qu=
eue(struct request_queue *q);
1671d522cdd9933d Ming Lei          2017-03-27  334  void blk_freeze_queue_s=
tart(struct request_queue *q);
6bae363ee3057a14 Keith Busch       2017-03-01  335  void blk_mq_freeze_queu=
e_wait(struct request_queue *q);
f91328c40a559362 Keith Busch       2017-03-01  336  int blk_mq_freeze_queue=
_wait_timeout(struct request_queue *q,
f91328c40a559362 Keith Busch       2017-03-01  337  				     unsigned long =
timeout);
320ae51feed5c2f1 Jens Axboe        2013-10-24  338  =

ed76e329d74a4b15 Jens Axboe        2018-10-29  339  int blk_mq_map_queues(s=
truct blk_mq_queue_map *qmap);
868f2f0b72068a09 Keith Busch       2015-12-17  340  void blk_mq_update_nr_h=
w_queues(struct blk_mq_tag_set *set, int nr_hw_queues);
868f2f0b72068a09 Keith Busch       2015-12-17  341  =

852ec80983d682dc Bart Van Assche   2017-06-21  342  void blk_mq_quiesce_que=
ue_nowait(struct request_queue *q);
4f084b41a0c04a69 Ming Lei          2017-06-06  343  =

9cf2bab6307659b9 Jens Axboe        2018-10-31  344  unsigned int blk_mq_rq_=
cpu(struct request *rq);
9cf2bab6307659b9 Jens Axboe        2018-10-31  345  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  346  /*
320ae51feed5c2f1 Jens Axboe        2013-10-24  347   * Driver command data =
is immediately after the request. So subtract request
2963e3f7e8e34658 Jens Axboe        2015-04-09  348   * size to get back to =
the original request, add request size to get the PDU.
320ae51feed5c2f1 Jens Axboe        2013-10-24  349   */
320ae51feed5c2f1 Jens Axboe        2013-10-24  350  static inline struct re=
quest *blk_mq_rq_from_pdu(void *pdu)
320ae51feed5c2f1 Jens Axboe        2013-10-24  351  {
320ae51feed5c2f1 Jens Axboe        2013-10-24  352  	return pdu - sizeof(st=
ruct request);
320ae51feed5c2f1 Jens Axboe        2013-10-24  353  }
320ae51feed5c2f1 Jens Axboe        2013-10-24  354  static inline void *blk=
_mq_rq_to_pdu(struct request *rq)
320ae51feed5c2f1 Jens Axboe        2013-10-24  355  {
2963e3f7e8e34658 Jens Axboe        2015-04-09  356  	return rq + 1;
320ae51feed5c2f1 Jens Axboe        2013-10-24  357  }
320ae51feed5c2f1 Jens Axboe        2013-10-24  358  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  359  #define queue_for_each_=
hw_ctx(q, hctx, i)				\
0d0b7d427987f6e9 Jose Alonso       2014-01-28  360  	for ((i) =3D 0; (i) < =
(q)->nr_hw_queues &&			\
0d0b7d427987f6e9 Jose Alonso       2014-01-28  361  	     ({ hctx =3D (q)->=
queue_hw_ctx[i]; 1; }); (i)++)
320ae51feed5c2f1 Jens Axboe        2013-10-24  362  =

320ae51feed5c2f1 Jens Axboe        2013-10-24  363  #define hctx_for_each_c=
tx(hctx, ctx, i)					\
0d0b7d427987f6e9 Jose Alonso       2014-01-28  364  	for ((i) =3D 0; (i) < =
(hctx)->nr_ctx &&				\
0d0b7d427987f6e9 Jose Alonso       2014-01-28  365  	     ({ ctx =3D (hctx)=
->ctxs[(i)]; 1; }); (i)++)
320ae51feed5c2f1 Jens Axboe        2013-10-24  366  =

7b7ab780a048699d Sagi Grimberg     2018-12-14  367  static inline blk_qc_t =
request_to_qc_t(struct blk_mq_hw_ctx *hctx,
7b7ab780a048699d Sagi Grimberg     2018-12-14  368  		struct request *rq)
7b7ab780a048699d Sagi Grimberg     2018-12-14  369  {
7b7ab780a048699d Sagi Grimberg     2018-12-14  370  	if (rq->tag !=3D -1)
7b7ab780a048699d Sagi Grimberg     2018-12-14  371  		return rq->tag | (hct=
x->queue_num << BLK_QC_T_SHIFT);
7b7ab780a048699d Sagi Grimberg     2018-12-14  372  =

7b7ab780a048699d Sagi Grimberg     2018-12-14 @373  	return rq->internal_ta=
g | (hctx->queue_num << BLK_QC_T_SHIFT) |
7b7ab780a048699d Sagi Grimberg     2018-12-14  374  			BLK_QC_T_INTERNAL;
7b7ab780a048699d Sagi Grimberg     2018-12-14  375  }
7b7ab780a048699d Sagi Grimberg     2018-12-14  376  =


:::::: The code@line 271 was first introduced by commit
:::::: 9a95e4ef709533efac4aafcb8bddf73f96db50ed block, nvme: Introduce blk_=
mq_req_flags_t

:::::: TO: Bart Van Assche <bart.vanassche@wdc.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6245505776032880395==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6245505776032880395==--

