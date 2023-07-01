Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1028317D2
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jul 2023 05:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688188741; x=1719724741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dFxqDm32yIKM0w2p8Ivue/UlmAdHfGx0dK9tFe2uG0=;
  b=mKz67LGABEbyR56AVFrG2eqr6+gRHAPCZe0GXq7I1rXW3udEQojeW/TH
   hdK4iJEXfiozpS2gRgNsSfSoQNBVdqBGmiut3coGoRQjPVEtYWFL+NoXF
   V1Ge1xc+2y09jF/EEnP2naTyTO3y2b0sF0JTlW7PcthdwvPN3VcjcIbMQ
   PmAfAXyt3IRl5d7yxPvpbyaH7z4uMJB+9Qm8CY46gTLjDUVqe/hOYHgYk
   ImHR8eg86GapQ2W+5CO0N8zQQ5hPWHTCeMNMQ8/pkL7V2S/uLrDxXcSrc
   SkMUXfL1Yka3l0Ied893eMRjEUK68qbb0U2N3/JgMaIY1AYZK3mzM7939
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342139793"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="342139793"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 22:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="721186851"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="721186851"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jun 2023 22:18:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFT0b-000Fj8-2K;
	Sat, 01 Jul 2023 05:18:57 +0000
Date: Sat, 1 Jul 2023 13:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/firewire/amdtp-stream.c:1099 process_rx_packets() error:
 uninitialized symbol 'curr_cycle_time'.
Message-ID: <202307011324.jFJ96dTo-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b25f62ccb490680a8cee755ac4528909395e0711
commit: fef4e61b0b765b6d22badcd5b6575b159e7d510a ALSA: firewire-lib: extend tracepoints event including CYCLE_TIME of 1394 OHCI
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-m021-20230701 (https://download.01.org/0day-ci/archive/20230701/202307011324.jFJ96dTo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011324.jFJ96dTo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307011324.jFJ96dTo-lkp@intel.com/

New smatch warnings:
sound/firewire/amdtp-stream.c:1099 process_rx_packets() error: uninitialized symbol 'curr_cycle_time'.

Old smatch warnings:
sound/firewire/amdtp-stream.c:944 generate_tx_packet_descs() error: uninitialized symbol 'curr_cycle_time'.

vim +/curr_cycle_time +1099 sound/firewire/amdtp-stream.c

0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1046  
9b1fcd9bf80206 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1047  static void process_rx_packets(struct fw_iso_context *context, u32 tstamp, size_t header_length,
9b1fcd9bf80206 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1048  			       void *header, void *private_data)
0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1049  {
0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1050  	struct amdtp_stream *s = private_data;
69efd5c4bd4c0e sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08  1051  	const struct amdtp_domain *d = s->domain;
0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1052  	const __be32 *ctx_header = header;
9b1fcd9bf80206 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1053  	const unsigned int events_per_period = d->events_per_period;
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1054  	unsigned int event_count = s->ctx_data.rx.event_count;
f0117128879be6 sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-09  1055  	struct pkt_desc *desc = s->packet_descs_cursor;
233dbbc7af5d27 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1056  	unsigned int pkt_header_length;
a0e023317e2d55 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1057  	unsigned int packets;
fef4e61b0b765b sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-10  1058  	u32 curr_cycle_time;
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1059  	bool need_hw_irq;
0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1060  	int i;
0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1061  
0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1062  	if (s->packet_index < 0)
0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1063  		return;
0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1064  
a0e023317e2d55 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1065  	// Calculate the number of packets in buffer and check XRUN.
a0e023317e2d55 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1066  	packets = header_length / sizeof(*ctx_header);
a0e023317e2d55 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1067  
cec371ff1ab18d sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-09  1068  	generate_rx_packet_descs(s, desc, ctx_header, packets);
0f5cfcb24d9c93 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1069  
cec371ff1ab18d sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-09  1070  	process_ctx_payloads(s, desc, packets);
5e2ece0fdceb02 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1071  
233dbbc7af5d27 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1072  	if (!(s->flags & CIP_NO_HEADER))
233dbbc7af5d27 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1073  		pkt_header_length = IT_PKT_HEADER_SIZE_CIP;
233dbbc7af5d27 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1074  	else
233dbbc7af5d27 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1075  		pkt_header_length = 0;
233dbbc7af5d27 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1076  
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1077  	if (s == d->irq_target) {
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1078  		// At NO_PERIOD_WAKEUP mode, the packets for all IT/IR contexts are processed by
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1079  		// the tasks of user process operating ALSA PCM character device by calling ioctl(2)
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1080  		// with some requests, instead of scheduled hardware IRQ of an IT context.
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1081  		struct snd_pcm_substream *pcm = READ_ONCE(s->pcm);
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1082  		need_hw_irq = !pcm || !pcm->runtime->no_period_wakeup;
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1083  	} else {
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1084  		need_hw_irq = false;
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1085  	}
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1086  
fef4e61b0b765b sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-10  1087  	if (trace_amdtp_packet_enabled())
fef4e61b0b765b sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-10  1088  		(void)fw_card_read_cycle_time(fw_parent_device(s->unit)->card, &curr_cycle_time);
fef4e61b0b765b sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-10  1089  
5e2ece0fdceb02 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1090  	for (i = 0; i < packets; ++i) {
6bc1a2699b79d7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1091  		struct {
6bc1a2699b79d7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1092  			struct fw_iso_packet params;
67d92ee7a50b00 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1093  			__be32 header[CIP_HEADER_QUADLETS];
6bc1a2699b79d7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1094  		} template = { {0}, {0} };
e229853d505d7a sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1095  		bool sched_irq = false;
6bc1a2699b79d7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-24  1096  
233dbbc7af5d27 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-20  1097  		build_it_pkt_header(s, desc->cycle, &template.params, pkt_header_length,
f4f6ae7b7c1fdb sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-07-22  1098  				    desc->data_blocks, desc->data_block_counter,
fef4e61b0b765b sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-10 @1099  				    desc->syt, i, curr_cycle_time);
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1100  
2472cfb3232caf sound/firewire/amdtp-stream.c Takashi Sakamoto 2020-05-08  1101  		if (s == s->domain->irq_target) {
e229853d505d7a sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1102  			event_count += desc->data_blocks;
e229853d505d7a sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1103  			if (event_count >= events_per_period) {
e229853d505d7a sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1104  				event_count -= events_per_period;
d360870a5bcff7 sound/firewire/amdtp-stream.c Takashi Sakamoto 2021-05-27  1105  				sched_irq = need_hw_irq;
e229853d505d7a sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1106  			}
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1107  		}
e229853d505d7a sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1108  
e229853d505d7a sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1109  		if (queue_out_packet(s, &template.params, sched_irq) < 0) {
fce9b013fee94d sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-05-21  1110  			cancel_stream(s);
a4103bd7fdd595 sound/firewire/amdtp.c        Takashi Sakamoto 2015-05-22  1111  			return;
ccccad8646fad5 sound/firewire/amdtp.c        Takashi Sakamoto 2014-04-25  1112  		}
cec371ff1ab18d sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-09  1113  
cec371ff1ab18d sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-09  1114  		desc = amdtp_stream_next_packet_desc(s, desc);
a4103bd7fdd595 sound/firewire/amdtp.c        Takashi Sakamoto 2015-05-22  1115  	}
a4103bd7fdd595 sound/firewire/amdtp.c        Takashi Sakamoto 2015-05-22  1116  
60dd49298ec580 sound/firewire/amdtp-stream.c Takashi Sakamoto 2019-10-18  1117  	s->ctx_data.rx.event_count = event_count;
f0117128879be6 sound/firewire/amdtp-stream.c Takashi Sakamoto 2023-01-09  1118  	s->packet_descs_cursor = desc;
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1119  }
31ef9134eb5263 sound/firewire/amdtp.c        Clemens Ladisch  2011-03-15  1120  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
