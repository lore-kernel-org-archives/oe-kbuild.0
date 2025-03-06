Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685D9255252
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 17:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282825; cv=none; b=UaVB6kc033nHdYmUhzmJT7Rp5gW3zkLSMEXUGJgetG/1XjNg+XqRCn3igkzq7nbAHw3Wp88Ovod9Hs4i9oLeaFQbaSpNd48OXJF0QXDWpmM9V4FmFaze+8zJ/VsMwiOfCQI/D7jjl4VFAJD0hHkmpc8HAtmrmIvzlLzTjyesBsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282825; c=relaxed/simple;
	bh=R2L/LXTuUoGyQNxQQC/YDNJYZg71Ck5FDuu6luZUwqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eqzTpxfrqUmQtlYwIfCQoaLYhYcxWpbnHIcGG7jaEa21vwvBn1JFz7DYQEni0NXqqTQqXrTytXCbyCbHY8nQ14cfNDmS4hdJPTRBIDg+NazkdFKk5aISJ1L6eJ6mOA7qNDT6xKNLiA6iRw1IW8fypCi29OBblPxR9iohLPrKc1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LBrsPNeT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LBrsPNeT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741282821; x=1772818821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R2L/LXTuUoGyQNxQQC/YDNJYZg71Ck5FDuu6luZUwqM=;
  b=LBrsPNeTfmIJ9nfWN/J4UzbX4IJVFJFfZjaLTUrYX7J8H5O1axSnsB6O
   fvXolKfwgwEwezvEY/yK8Gqp2psSY4NXfiPj52bxP1MkLWfo+ozmur7Uu
   UvhR5uCzEoW7pKG7Eew82Cn0vnMBYqUnHY8aBsV/Dy1UBXt6LIHo4mbLx
   +3YNtMMFoYKrBOL8tL826sP3Ivc74vOi0e5VbCT3XDJ8yRCgORfgFGiz/
   q0L1MR3pWn/KbSIjp8uA2gGoJfjjX8U1CnxaZVU+fImEyKSOd5XLXcvJE
   Y4IXmIt1elb/B8JPShbw0mkkh3Ub7bygTbR7GVObvl/KHCcSKnXFX0YcU
   Q==;
X-CSE-ConnectionGUID: /wzbtYKRQpOCumllr18Vug==
X-CSE-MsgGUID: FXmc74pGR6i6+7lDRqKXWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="45963605"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="45963605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 09:39:50 -0800
X-CSE-ConnectionGUID: 1ffvV8pUTF6e1U/SDSMDnA==
X-CSE-MsgGUID: HZDM1lsiQqeRP7l4/k7mPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119590496"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2025 09:39:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqFCE-000NOk-06;
	Thu, 06 Mar 2025 17:39:46 +0000
Date: Fri, 7 Mar 2025 01:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8121/9212]
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more
 than once.
Message-ID: <202503070155.TuUngwD3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
commit: dd331404ac7c155b2863038864901049fcf9d3fe [8121/9212] drm/msm/dpu: Configure CWB in writeback encoder
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503070155.TuUngwD3-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c: dpu_hw_cwb.h is included more than once.

vim +27 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

    20	
    21	#include "msm_drv.h"
    22	#include "dpu_kms.h"
    23	#include "dpu_hwio.h"
    24	#include "dpu_hw_catalog.h"
    25	#include "dpu_hw_intf.h"
    26	#include "dpu_hw_ctl.h"
  > 27	#include "dpu_hw_cwb.h"
    28	#include "dpu_hw_dspp.h"
    29	#include "dpu_hw_dsc.h"
    30	#include "dpu_hw_merge3d.h"
    31	#include "dpu_hw_cdm.h"
  > 32	#include "dpu_hw_cwb.h"
    33	#include "dpu_formats.h"
    34	#include "dpu_encoder_phys.h"
    35	#include "dpu_crtc.h"
    36	#include "dpu_trace.h"
    37	#include "dpu_core_irq.h"
    38	#include "disp/msm_disp_snapshot.h"
    39	
    40	#define DPU_DEBUG_ENC(e, fmt, ...) DRM_DEBUG_ATOMIC("enc%d " fmt,\
    41			(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
    42	
    43	#define DPU_ERROR_ENC(e, fmt, ...) DPU_ERROR("enc%d " fmt,\
    44			(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
    45	
    46	#define DPU_ERROR_ENC_RATELIMITED(e, fmt, ...) DPU_ERROR_RATELIMITED("enc%d " fmt,\
    47			(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
    48	
    49	/*
    50	 * Two to anticipate panels that can do cmd/vid dynamic switching
    51	 * plan is to create all possible physical encoder types, and switch between
    52	 * them at runtime
    53	 */
    54	#define NUM_PHYS_ENCODER_TYPES 2
    55	
    56	#define MAX_PHYS_ENCODERS_PER_VIRTUAL \
    57		(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
    58	
    59	#define MAX_CHANNELS_PER_ENC 2
    60	
    61	#define IDLE_SHORT_TIMEOUT	1
    62	
    63	/* timeout in frames waiting for frame done */
    64	#define DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES 5
    65	
    66	/**
    67	 * enum dpu_enc_rc_events - events for resource control state machine
    68	 * @DPU_ENC_RC_EVENT_KICKOFF:
    69	 *	This event happens at NORMAL priority.
    70	 *	Event that signals the start of the transfer. When this event is
    71	 *	received, enable MDP/DSI core clocks. Regardless of the previous
    72	 *	state, the resource should be in ON state at the end of this event.
    73	 * @DPU_ENC_RC_EVENT_FRAME_DONE:
    74	 *	This event happens at INTERRUPT level.
    75	 *	Event signals the end of the data transfer after the PP FRAME_DONE
    76	 *	event. At the end of this event, a delayed work is scheduled to go to
    77	 *	IDLE_PC state after IDLE_TIMEOUT time.
    78	 * @DPU_ENC_RC_EVENT_PRE_STOP:
    79	 *	This event happens at NORMAL priority.
    80	 *	This event, when received during the ON state, leave the RC STATE
    81	 *	in the PRE_OFF state. It should be followed by the STOP event as
    82	 *	part of encoder disable.
    83	 *	If received during IDLE or OFF states, it will do nothing.
    84	 * @DPU_ENC_RC_EVENT_STOP:
    85	 *	This event happens at NORMAL priority.
    86	 *	When this event is received, disable all the MDP/DSI core clocks, and
    87	 *	disable IRQs. It should be called from the PRE_OFF or IDLE states.
    88	 *	IDLE is expected when IDLE_PC has run, and PRE_OFF did nothing.
    89	 *	PRE_OFF is expected when PRE_STOP was executed during the ON state.
    90	 *	Resource state should be in OFF at the end of the event.
    91	 * @DPU_ENC_RC_EVENT_ENTER_IDLE:
    92	 *	This event happens at NORMAL priority from a work item.
    93	 *	Event signals that there were no frame updates for IDLE_TIMEOUT time.
    94	 *	This would disable MDP/DSI core clocks and change the resource state
    95	 *	to IDLE.
    96	 */
    97	enum dpu_enc_rc_events {
    98		DPU_ENC_RC_EVENT_KICKOFF = 1,
    99		DPU_ENC_RC_EVENT_FRAME_DONE,
   100		DPU_ENC_RC_EVENT_PRE_STOP,
   101		DPU_ENC_RC_EVENT_STOP,
   102		DPU_ENC_RC_EVENT_ENTER_IDLE
   103	};
   104	
   105	/*
   106	 * enum dpu_enc_rc_states - states that the resource control maintains
   107	 * @DPU_ENC_RC_STATE_OFF: Resource is in OFF state
   108	 * @DPU_ENC_RC_STATE_PRE_OFF: Resource is transitioning to OFF state
   109	 * @DPU_ENC_RC_STATE_ON: Resource is in ON state
   110	 * @DPU_ENC_RC_STATE_MODESET: Resource is in modeset state
   111	 * @DPU_ENC_RC_STATE_IDLE: Resource is in IDLE state
   112	 */
   113	enum dpu_enc_rc_states {
   114		DPU_ENC_RC_STATE_OFF,
   115		DPU_ENC_RC_STATE_PRE_OFF,
   116		DPU_ENC_RC_STATE_ON,
   117		DPU_ENC_RC_STATE_IDLE
   118	};
   119	
   120	/**
   121	 * struct dpu_encoder_virt - virtual encoder. Container of one or more physical
   122	 *	encoders. Virtual encoder manages one "logical" display. Physical
   123	 *	encoders manage one intf block, tied to a specific panel/sub-panel.
   124	 *	Virtual encoder defers as much as possible to the physical encoders.
   125	 *	Virtual encoder registers itself with the DRM Framework as the encoder.
   126	 * @base:		drm_encoder base class for registration with DRM
   127	 * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
   128	 * @enabled:		True if the encoder is active, protected by enc_lock
   129	 * @commit_done_timedout: True if there has been a timeout on commit after
   130	 *			enabling the encoder.
   131	 * @num_phys_encs:	Actual number of physical encoders contained.
   132	 * @phys_encs:		Container of physical encoders managed.
   133	 * @cur_master:		Pointer to the current master in this mode. Optimization
   134	 *			Only valid after enable. Cleared as disable.
   135	 * @cur_slave:		As above but for the slave encoder.
   136	 * @hw_pp:		Handle to the pingpong blocks used for the display. No.
   137	 *			pingpong blocks can be different than num_phys_encs.
   138	 * @hw_cwb:		Handle to the CWB muxes used for concurrent writeback
   139	 *			display. Number of CWB muxes can be different than
   140	 *			num_phys_encs.
   141	 * @hw_dsc:		Handle to the DSC blocks used for the display.
   142	 * @dsc_mask:		Bitmask of used DSC blocks.
   143	 * @cwb_mask		Bitmask of used CWB muxes
   144	 * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
   145	 *			for partial update right-only cases, such as pingpong
   146	 *			split where virtual pingpong does not generate IRQs
   147	 * @crtc:		Pointer to the currently assigned crtc. Normally you
   148	 *			would use crtc->state->encoder_mask to determine the
   149	 *			link between encoder/crtc. However in this case we need
   150	 *			to track crtc in the disable() hook which is called
   151	 *			_after_ encoder_mask is cleared.
   152	 * @connector:		If a mode is set, cached pointer to the active connector
   153	 * @enc_lock:			Lock around physical encoder
   154	 *				create/destroy/enable/disable
   155	 * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
   156	 *				busy processing current command.
   157	 *				Bit0 = phys_encs[0] etc.
   158	 * @frame_done_timeout_ms:	frame done timeout in ms
   159	 * @frame_done_timeout_cnt:	atomic counter tracking the number of frame
   160	 * 				done timeouts
   161	 * @frame_done_timer:		watchdog timer for frame done event
   162	 * @disp_info:			local copy of msm_display_info struct
   163	 * @idle_pc_supported:		indicate if idle power collaps is supported
   164	 * @rc_lock:			resource control mutex lock to protect
   165	 *				virt encoder over various state changes
   166	 * @rc_state:			resource controller state
   167	 * @delayed_off_work:		delayed worker to schedule disabling of
   168	 *				clks and resources after IDLE_TIMEOUT time.
   169	 * @topology:                   topology of the display
   170	 * @idle_timeout:		idle timeout duration in milliseconds
   171	 * @wide_bus_en:		wide bus is enabled on this interface
   172	 * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
   173	 */
   174	struct dpu_encoder_virt {
   175		struct drm_encoder base;
   176		spinlock_t enc_spinlock;
   177	
   178		bool enabled;
   179		bool commit_done_timedout;
   180	
   181		unsigned int num_phys_encs;
   182		struct dpu_encoder_phys *phys_encs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
   183		struct dpu_encoder_phys *cur_master;
   184		struct dpu_encoder_phys *cur_slave;
   185		struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
   186		struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
   187		struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
   188	
   189		unsigned int dsc_mask;
   190		unsigned int cwb_mask;
   191	
   192		bool intfs_swapped;
   193	
   194		struct drm_crtc *crtc;
   195		struct drm_connector *connector;
   196	
   197		struct mutex enc_lock;
   198		DECLARE_BITMAP(frame_busy_mask, MAX_PHYS_ENCODERS_PER_VIRTUAL);
   199	
   200		atomic_t frame_done_timeout_ms;
   201		atomic_t frame_done_timeout_cnt;
   202		struct timer_list frame_done_timer;
   203	
   204		struct msm_display_info disp_info;
   205	
   206		bool idle_pc_supported;
   207		struct mutex rc_lock;
   208		enum dpu_enc_rc_states rc_state;
   209		struct delayed_work delayed_off_work;
   210		struct msm_display_topology topology;
   211	
   212		u32 idle_timeout;
   213	
   214		bool wide_bus_en;
   215	
   216		/* DSC configuration */
   217		struct drm_dsc_config *dsc;
   218	};
   219	
   220	#define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
   221	
   222	static u32 dither_matrix[DITHER_MATRIX_SZ] = {
   223		15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
   224	};
   225	
   226	/**
   227	 * dpu_encoder_get_drm_fmt - return DRM fourcc format
   228	 * @phys_enc: Pointer to physical encoder structure
   229	 */
   230	u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
   231	{
   232		struct drm_encoder *drm_enc;
   233		struct dpu_encoder_virt *dpu_enc;
   234		struct drm_display_info *info;
   235		struct drm_display_mode *mode;
   236	
   237		drm_enc = phys_enc->parent;
   238		dpu_enc = to_dpu_encoder_virt(drm_enc);
   239		info = &dpu_enc->connector->display_info;
   240		mode = &phys_enc->cached_mode;
   241	
   242		if (drm_mode_is_420_only(info, mode))
   243			return DRM_FORMAT_YUV420;
   244	
   245		return DRM_FORMAT_RGB888;
   246	}
   247	
   248	/**
   249	 * dpu_encoder_needs_periph_flush - return true if physical encoder requires
   250	 *	peripheral flush
   251	 * @phys_enc: Pointer to physical encoder structure
   252	 */
   253	bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
   254	{
   255		struct drm_encoder *drm_enc;
   256		struct dpu_encoder_virt *dpu_enc;
   257		struct msm_display_info *disp_info;
   258		struct msm_drm_private *priv;
   259		struct drm_display_mode *mode;
   260	
   261		drm_enc = phys_enc->parent;
   262		dpu_enc = to_dpu_encoder_virt(drm_enc);
   263		disp_info = &dpu_enc->disp_info;
   264		priv = drm_enc->dev->dev_private;
   265		mode = &phys_enc->cached_mode;
   266	
   267		return phys_enc->hw_intf->cap->type == INTF_DP &&
   268		       msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
   269	}
   270	
   271	/**
   272	 * dpu_encoder_is_widebus_enabled - return bool value if widebus is enabled
   273	 * @drm_enc:    Pointer to previously created drm encoder structure
   274	 */
   275	bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
   276	{
   277		const struct dpu_encoder_virt *dpu_enc;
   278		struct msm_drm_private *priv = drm_enc->dev->dev_private;
   279		const struct msm_display_info *disp_info;
   280		int index;
   281	
   282		dpu_enc = to_dpu_encoder_virt(drm_enc);
   283		disp_info = &dpu_enc->disp_info;
   284		index = disp_info->h_tile_instance[0];
   285	
   286		if (disp_info->intf_type == INTF_DP)
   287			return msm_dp_wide_bus_available(priv->dp[index]);
   288		else if (disp_info->intf_type == INTF_DSI)
   289			return msm_dsi_wide_bus_enabled(priv->dsi[index]);
   290	
   291		return false;
   292	}
   293	
   294	/**
   295	 * dpu_encoder_is_dsc_enabled - indicate whether dsc is enabled
   296	 *				for the encoder.
   297	 * @drm_enc:    Pointer to previously created drm encoder structure
   298	 */
   299	bool dpu_encoder_is_dsc_enabled(const struct drm_encoder *drm_enc)
   300	{
   301		const struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
   302	
   303		return dpu_enc->dsc ? true : false;
   304	}
   305	
   306	/**
   307	 * dpu_encoder_get_crc_values_cnt - get number of physical encoders contained
   308	 *	in virtual encoder that can collect CRC values
   309	 * @drm_enc:    Pointer to previously created drm encoder structure
   310	 * Returns:     Number of physical encoders for given drm encoder
   311	 */
   312	int dpu_encoder_get_crc_values_cnt(const struct drm_encoder *drm_enc)
   313	{
   314		struct dpu_encoder_virt *dpu_enc;
   315		int i, num_intf = 0;
   316	
   317		dpu_enc = to_dpu_encoder_virt(drm_enc);
   318	
   319		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
   320			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
   321	
   322			if (phys->hw_intf && phys->hw_intf->ops.setup_misr
   323					&& phys->hw_intf->ops.collect_misr)
   324				num_intf++;
   325		}
   326	
   327		return num_intf;
   328	}
   329	
   330	/**
   331	 * dpu_encoder_setup_misr - enable misr calculations
   332	 * @drm_enc:    Pointer to previously created drm encoder structure
   333	 */
   334	void dpu_encoder_setup_misr(const struct drm_encoder *drm_enc)
   335	{
   336		struct dpu_encoder_virt *dpu_enc;
   337	
   338		int i;
   339	
   340		dpu_enc = to_dpu_encoder_virt(drm_enc);
   341	
   342		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
   343			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
   344	
   345			if (!phys->hw_intf || !phys->hw_intf->ops.setup_misr)
   346				continue;
   347	
   348			phys->hw_intf->ops.setup_misr(phys->hw_intf);
   349		}
   350	}
   351	
   352	/**
   353	 * dpu_encoder_get_crc - get the crc value from interface blocks
   354	 * @drm_enc:    Pointer to previously created drm encoder structure
   355	 * @crcs:	array to fill with CRC data
   356	 * @pos:	offset into the @crcs array
   357	 * Returns:     0 on success, error otherwise
   358	 */
   359	int dpu_encoder_get_crc(const struct drm_encoder *drm_enc, u32 *crcs, int pos)
   360	{
   361		struct dpu_encoder_virt *dpu_enc;
   362	
   363		int i, rc = 0, entries_added = 0;
   364	
   365		if (!drm_enc->crtc) {
   366			DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
   367			return -EINVAL;
   368		}
   369	
   370		dpu_enc = to_dpu_encoder_virt(drm_enc);
   371	
   372		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
   373			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
   374	
   375			if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
   376				continue;
   377	
   378			rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[pos + entries_added]);
   379			if (rc)
   380				return rc;
   381			entries_added++;
   382		}
   383	
   384		return entries_added;
   385	}
   386	
   387	static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
   388	{
   389		struct dpu_hw_dither_cfg dither_cfg = { 0 };
   390	
   391		if (!hw_pp->ops.setup_dither)
   392			return;
   393	
   394		switch (bpc) {
   395		case 6:
   396			dither_cfg.c0_bitdepth = 6;
   397			dither_cfg.c1_bitdepth = 6;
   398			dither_cfg.c2_bitdepth = 6;
   399			dither_cfg.c3_bitdepth = 6;
   400			dither_cfg.temporal_en = 0;
   401			break;
   402		default:
   403			hw_pp->ops.setup_dither(hw_pp, NULL);
   404			return;
   405		}
   406	
   407		memcpy(&dither_cfg.matrix, dither_matrix,
   408				sizeof(u32) * DITHER_MATRIX_SZ);
   409	
   410		hw_pp->ops.setup_dither(hw_pp, &dither_cfg);
   411	}
   412	
   413	static char *dpu_encoder_helper_get_intf_type(enum dpu_intf_mode intf_mode)
   414	{
   415		switch (intf_mode) {
   416		case INTF_MODE_VIDEO:
   417			return "INTF_MODE_VIDEO";
   418		case INTF_MODE_CMD:
   419			return "INTF_MODE_CMD";
   420		case INTF_MODE_WB_BLOCK:
   421			return "INTF_MODE_WB_BLOCK";
   422		case INTF_MODE_WB_LINE:
   423			return "INTF_MODE_WB_LINE";
   424		default:
   425			return "INTF_MODE_UNKNOWN";
   426		}
   427	}
   428	
   429	/**
   430	 * dpu_encoder_helper_report_irq_timeout - utility to report error that irq has
   431	 *	timed out, including reporting frame error event to crtc and debug dump
   432	 * @phys_enc: Pointer to physical encoder structure
   433	 * @intr_idx: Failing interrupt index
   434	 */
   435	void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
   436			enum dpu_intr_idx intr_idx)
   437	{
   438		DRM_ERROR("irq timeout id=%u, intf_mode=%s intf=%d wb=%d, pp=%d, intr=%d\n",
   439				DRMID(phys_enc->parent),
   440				dpu_encoder_helper_get_intf_type(phys_enc->intf_mode),
   441				phys_enc->hw_intf ? phys_enc->hw_intf->idx - INTF_0 : -1,
   442				phys_enc->hw_wb ? phys_enc->hw_wb->idx - WB_0 : -1,
   443				phys_enc->hw_pp->idx - PINGPONG_0, intr_idx);
   444	
   445		dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc,
   446					DPU_ENCODER_FRAME_EVENT_ERROR);
   447	}
   448	
   449	static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
   450			u32 irq_idx, struct dpu_encoder_wait_info *info);
   451	
   452	/**
   453	 * dpu_encoder_helper_wait_for_irq - utility to wait on an irq.
   454	 *	note: will call dpu_encoder_helper_wait_for_irq on timeout
   455	 * @phys_enc: Pointer to physical encoder structure
   456	 * @irq_idx: IRQ index
   457	 * @func: IRQ callback to be called in case of timeout
   458	 * @wait_info: wait info struct
   459	 * @return: 0 or -ERROR
   460	 */
   461	int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
   462			unsigned int irq_idx,
   463			void (*func)(void *arg),
   464			struct dpu_encoder_wait_info *wait_info)
   465	{
   466		u32 irq_status;
   467		int ret;
   468	
   469		if (!wait_info) {
   470			DPU_ERROR("invalid params\n");
   471			return -EINVAL;
   472		}
   473		/* note: do master / slave checking outside */
   474	
   475		/* return EWOULDBLOCK since we know the wait isn't necessary */
   476		if (phys_enc->enable_state == DPU_ENC_DISABLED) {
   477			DRM_ERROR("encoder is disabled id=%u, callback=%ps, IRQ=[%d, %d]\n",
   478				  DRMID(phys_enc->parent), func,
   479				  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
   480			return -EWOULDBLOCK;
   481		}
   482	
   483		if (irq_idx == 0) {
   484			DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
   485				      DRMID(phys_enc->parent), func);
   486			return 0;
   487		}
   488	
   489		DRM_DEBUG_KMS("id=%u, callback=%ps, IRQ=[%d, %d], pp=%d, pending_cnt=%d\n",
   490			      DRMID(phys_enc->parent), func,
   491			      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), phys_enc->hw_pp->idx - PINGPONG_0,
   492			      atomic_read(wait_info->atomic_cnt));
   493	
   494		ret = dpu_encoder_helper_wait_event_timeout(
   495				DRMID(phys_enc->parent),
   496				irq_idx,
   497				wait_info);
   498	
   499		if (ret <= 0) {
   500			irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq_idx);
   501			if (irq_status) {
   502				unsigned long flags;
   503	
   504				DRM_DEBUG_KMS("IRQ=[%d, %d] not triggered id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",
   505					      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
   506					      DRMID(phys_enc->parent), func,
   507					      phys_enc->hw_pp->idx - PINGPONG_0,
   508					      atomic_read(wait_info->atomic_cnt));
   509				local_irq_save(flags);
   510				func(phys_enc);
   511				local_irq_restore(flags);
   512				ret = 0;
   513			} else {
   514				ret = -ETIMEDOUT;
   515				DRM_DEBUG_KMS("IRQ=[%d, %d] timeout id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",
   516					      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
   517					      DRMID(phys_enc->parent), func,
   518					      phys_enc->hw_pp->idx - PINGPONG_0,
   519					      atomic_read(wait_info->atomic_cnt));
   520			}
   521		} else {
   522			ret = 0;
   523			trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
   524				func, DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
   525				phys_enc->hw_pp->idx - PINGPONG_0,
   526				atomic_read(wait_info->atomic_cnt));
   527		}
   528	
   529		return ret;
   530	}
   531	
   532	/**
   533	 * dpu_encoder_get_vsync_count - get vsync count for the encoder.
   534	 * @drm_enc:    Pointer to previously created drm encoder structure
   535	 */
   536	int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc)
   537	{
   538		struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
   539		struct dpu_encoder_phys *phys = dpu_enc ? dpu_enc->cur_master : NULL;
   540		return phys ? atomic_read(&phys->vsync_cnt) : 0;
   541	}
   542	
   543	/**
   544	 * dpu_encoder_get_linecount - get interface line count for the encoder.
   545	 * @drm_enc:    Pointer to previously created drm encoder structure
   546	 */
   547	int dpu_encoder_get_linecount(struct drm_encoder *drm_enc)
   548	{
   549		struct dpu_encoder_virt *dpu_enc;
   550		struct dpu_encoder_phys *phys;
   551		int linecount = 0;
   552	
   553		dpu_enc = to_dpu_encoder_virt(drm_enc);
   554		phys = dpu_enc ? dpu_enc->cur_master : NULL;
   555	
   556		if (phys && phys->ops.get_line_count)
   557			linecount = phys->ops.get_line_count(phys);
   558	
   559		return linecount;
   560	}
   561	
   562	/**
   563	 * dpu_encoder_helper_split_config - split display configuration helper function
   564	 *	This helper function may be used by physical encoders to configure
   565	 *	the split display related registers.
   566	 * @phys_enc: Pointer to physical encoder structure
   567	 * @interface: enum dpu_intf setting
   568	 */
   569	void dpu_encoder_helper_split_config(
   570			struct dpu_encoder_phys *phys_enc,
   571			enum dpu_intf interface)
   572	{
   573		struct dpu_encoder_virt *dpu_enc;
   574		struct split_pipe_cfg cfg = { 0 };
   575		struct dpu_hw_mdp *hw_mdptop;
   576		struct msm_display_info *disp_info;
   577	
   578		if (!phys_enc->hw_mdptop || !phys_enc->parent) {
   579			DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != NULL);
   580			return;
   581		}
   582	
   583		dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
   584		hw_mdptop = phys_enc->hw_mdptop;
   585		disp_info = &dpu_enc->disp_info;
   586	
   587		if (disp_info->intf_type != INTF_DSI)
   588			return;
   589	
   590		/**
   591		 * disable split modes since encoder will be operating in as the only
   592		 * encoder, either for the entire use case in the case of, for example,
   593		 * single DSI, or for this frame in the case of left/right only partial
   594		 * update.
   595		 */
   596		if (phys_enc->split_role == ENC_ROLE_SOLO) {
   597			if (hw_mdptop->ops.setup_split_pipe)
   598				hw_mdptop->ops.setup_split_pipe(hw_mdptop, &cfg);
   599			return;
   600		}
   601	
   602		cfg.en = true;
   603		cfg.mode = phys_enc->intf_mode;
   604		cfg.intf = interface;
   605	
   606		if (cfg.en && phys_enc->ops.needs_single_flush &&
   607				phys_enc->ops.needs_single_flush(phys_enc))
   608			cfg.split_flush_en = true;
   609	
   610		if (phys_enc->split_role == ENC_ROLE_MASTER) {
   611			DPU_DEBUG_ENC(dpu_enc, "enable %d\n", cfg.en);
   612	
   613			if (hw_mdptop->ops.setup_split_pipe)
   614				hw_mdptop->ops.setup_split_pipe(hw_mdptop, &cfg);
   615		}
   616	}
   617	
   618	/**
   619	 * dpu_encoder_use_dsc_merge - returns true if the encoder uses DSC merge topology.
   620	 * @drm_enc:    Pointer to previously created drm encoder structure
   621	 */
   622	bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
   623	{
   624		struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
   625		int i, intf_count = 0, num_dsc = 0;
   626	
   627		for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
   628			if (dpu_enc->phys_encs[i])
   629				intf_count++;
   630	
   631		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
   632			if (dpu_enc->hw_dsc[i])
   633				num_dsc++;
   634	
   635		return (num_dsc > 0) && (num_dsc > intf_count);
   636	}
   637	
   638	/**
   639	 * dpu_encoder_get_dsc_config - get DSC config for the DPU encoder
   640	 *   This helper function is used by physical encoder to get DSC config
   641	 *   used for this encoder.
   642	 * @drm_enc: Pointer to encoder structure
   643	 */
   644	struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
   645	{
   646		struct msm_drm_private *priv = drm_enc->dev->dev_private;
   647		struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
   648		int index = dpu_enc->disp_info.h_tile_instance[0];
   649	
   650		if (dpu_enc->disp_info.intf_type == INTF_DSI)
   651			return msm_dsi_get_dsc_config(priv->dsi[index]);
   652	
   653		return NULL;
   654	}
   655	
   656	void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
   657					 struct msm_display_topology *topology,
   658					 struct drm_atomic_state *state,
   659					 const struct drm_display_mode *adj_mode)
   660	{
   661		struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
   662		struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
   663		struct msm_display_info *disp_info = &dpu_enc->disp_info;
   664		struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
   665		struct drm_connector *connector;
   666		struct drm_connector_state *conn_state;
   667		struct drm_framebuffer *fb;
   668		struct drm_dsc_config *dsc;
   669	
   670		int i;
   671	
   672		for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
   673			if (dpu_enc->phys_encs[i])
   674				topology->num_intf++;
   675	
   676		dsc = dpu_encoder_get_dsc_config(drm_enc);
   677	
   678		/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
   679		if (dsc) {
   680			/*
   681			 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
   682			 * when Display Stream Compression (DSC) is enabled,
   683			 * and when enough DSC blocks are available.
   684			 * This is power-optimal and can drive up to (including) 4k
   685			 * screens.
   686			 */
   687			WARN(topology->num_intf > 2,
   688			     "DSC topology cannot support more than 2 interfaces\n");
   689			if (topology->num_intf >= 2 || dpu_kms->catalog->dsc_count >= 2)
   690				topology->num_dsc = 2;
   691			else
   692				topology->num_dsc = 1;
   693		}
   694	
   695		connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
   696		if (!connector)
   697			return;
   698		conn_state = drm_atomic_get_new_connector_state(state, connector);
   699		if (!conn_state)
   700			return;
   701	
   702		/*
   703		 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
   704		 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
   705		 * earlier.
   706		 */
   707		if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
   708			fb = conn_state->writeback_job->fb;
   709	
   710			if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
   711				topology->num_cdm++;
   712		} else if (disp_info->intf_type == INTF_DP) {
   713			if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
   714				topology->num_cdm++;
   715		}
   716	}
   717	
   718	bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_state *state)
   719	{
   720		struct drm_connector *connector;
   721		struct drm_connector_state *conn_state;
   722		struct drm_framebuffer *fb;
   723		struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
   724	
   725		if (!drm_enc || !state)
   726			return false;
   727	
   728		connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
   729		if (!connector)
   730			return false;
   731	
   732		conn_state = drm_atomic_get_new_connector_state(state, connector);
   733	
   734		/**
   735		 * These checks are duplicated from dpu_encoder_update_topology() since
   736		 * CRTC and encoder don't hold topology information
   737		 */
   738		if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
   739			fb = conn_state->writeback_job->fb;
   740			if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb))) {
   741				if (!dpu_enc->cur_master->hw_cdm)
   742					return true;
   743			} else {
   744				if (dpu_enc->cur_master->hw_cdm)
   745					return true;
   746			}
   747		}
   748	
   749		return false;
   750	}
   751	
   752	static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
   753				struct msm_display_info *disp_info)
   754	{
   755		struct dpu_vsync_source_cfg vsync_cfg = { 0 };
   756		struct msm_drm_private *priv;
   757		struct dpu_kms *dpu_kms;
   758		struct dpu_hw_mdp *hw_mdptop;
   759		struct drm_encoder *drm_enc;
   760		struct dpu_encoder_phys *phys_enc;
   761		int i;
   762	
   763		if (!dpu_enc || !disp_info) {
   764			DPU_ERROR("invalid param dpu_enc:%d or disp_info:%d\n",
   765						dpu_enc != NULL, disp_info != NULL);
   766			return;
   767		} else if (dpu_enc->num_phys_encs > ARRAY_SIZE(dpu_enc->hw_pp)) {
   768			DPU_ERROR("invalid num phys enc %d/%d\n",
   769					dpu_enc->num_phys_encs,
   770					(int) ARRAY_SIZE(dpu_enc->hw_pp));
   771			return;
   772		}
   773	
   774		drm_enc = &dpu_enc->base;
   775		/* this pointers are checked in virt_enable_helper */
   776		priv = drm_enc->dev->dev_private;
   777	
   778		dpu_kms = to_dpu_kms(priv->kms);
   779		hw_mdptop = dpu_kms->hw_mdp;
   780		if (!hw_mdptop) {
   781			DPU_ERROR("invalid mdptop\n");
   782			return;
   783		}
   784	
   785		if (hw_mdptop->ops.setup_vsync_source) {
   786			for (i = 0; i < dpu_enc->num_phys_encs; i++)
   787				vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
   788	
   789			vsync_cfg.pp_count = dpu_enc->num_phys_encs;
   790			vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
   791	
   792			vsync_cfg.vsync_source = disp_info->vsync_source;
   793	
   794			hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
   795	
   796			for (i = 0; i < dpu_enc->num_phys_encs; i++) {
   797				phys_enc = dpu_enc->phys_encs[i];
   798	
   799				if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
   800					phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
   801							vsync_cfg.vsync_source);
   802			}
   803		}
   804	}
   805	
   806	static void _dpu_encoder_irq_enable(struct drm_encoder *drm_enc)
   807	{
   808		struct dpu_encoder_virt *dpu_enc;
   809		int i;
   810	
   811		if (!drm_enc) {
   812			DPU_ERROR("invalid encoder\n");
   813			return;
   814		}
   815	
   816		dpu_enc = to_dpu_encoder_virt(drm_enc);
   817	
   818		DPU_DEBUG_ENC(dpu_enc, "\n");
   819		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
   820			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
   821	
   822			phys->ops.irq_enable(phys);
   823		}
   824	}
   825	
   826	static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
   827	{
   828		struct dpu_encoder_virt *dpu_enc;
   829		int i;
   830	
   831		if (!drm_enc) {
   832			DPU_ERROR("invalid encoder\n");
   833			return;
   834		}
   835	
   836		dpu_enc = to_dpu_encoder_virt(drm_enc);
   837	
   838		DPU_DEBUG_ENC(dpu_enc, "\n");
   839		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
   840			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
   841	
   842			phys->ops.irq_disable(phys);
   843		}
   844	}
   845	
   846	static void _dpu_encoder_resource_enable(struct drm_encoder *drm_enc)
   847	{
   848		struct msm_drm_private *priv;
   849		struct dpu_kms *dpu_kms;
   850		struct dpu_encoder_virt *dpu_enc;
   851	
   852		dpu_enc = to_dpu_encoder_virt(drm_enc);
   853		priv = drm_enc->dev->dev_private;
   854		dpu_kms = to_dpu_kms(priv->kms);
   855	
   856		trace_dpu_enc_rc_enable(DRMID(drm_enc));
   857	
   858		if (!dpu_enc->cur_master) {
   859			DPU_ERROR("encoder master not set\n");
   860			return;
   861		}
   862	
   863		/* enable DPU core clks */
   864		pm_runtime_get_sync(&dpu_kms->pdev->dev);
   865	
   866		/* enable all the irq */
   867		_dpu_encoder_irq_enable(drm_enc);
   868	}
   869	
   870	static void _dpu_encoder_resource_disable(struct drm_encoder *drm_enc)
   871	{
   872		struct msm_drm_private *priv;
   873		struct dpu_kms *dpu_kms;
   874		struct dpu_encoder_virt *dpu_enc;
   875	
   876		dpu_enc = to_dpu_encoder_virt(drm_enc);
   877		priv = drm_enc->dev->dev_private;
   878		dpu_kms = to_dpu_kms(priv->kms);
   879	
   880		trace_dpu_enc_rc_disable(DRMID(drm_enc));
   881	
   882		if (!dpu_enc->cur_master) {
   883			DPU_ERROR("encoder master not set\n");
   884			return;
   885		}
   886	
   887		/* disable all the irq */
   888		_dpu_encoder_irq_disable(drm_enc);
   889	
   890		/* disable DPU core clks */
   891		pm_runtime_put_sync(&dpu_kms->pdev->dev);
   892	}
   893	
   894	static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
   895			u32 sw_event)
   896	{
   897		struct dpu_encoder_virt *dpu_enc;
   898		struct msm_drm_private *priv;
   899		bool is_vid_mode = false;
   900	
   901		if (!drm_enc || !drm_enc->dev || !drm_enc->crtc) {
   902			DPU_ERROR("invalid parameters\n");
   903			return -EINVAL;
   904		}
   905		dpu_enc = to_dpu_encoder_virt(drm_enc);
   906		priv = drm_enc->dev->dev_private;
   907		is_vid_mode = !dpu_enc->disp_info.is_cmd_mode;
   908	
   909		/*
   910		 * when idle_pc is not supported, process only KICKOFF, STOP and MODESET
   911		 * events and return early for other events (ie wb display).
   912		 */
   913		if (!dpu_enc->idle_pc_supported &&
   914				(sw_event != DPU_ENC_RC_EVENT_KICKOFF &&
   915				sw_event != DPU_ENC_RC_EVENT_STOP &&
   916				sw_event != DPU_ENC_RC_EVENT_PRE_STOP))
   917			return 0;
   918	
   919		trace_dpu_enc_rc(DRMID(drm_enc), sw_event, dpu_enc->idle_pc_supported,
   920				 dpu_enc->rc_state, "begin");
   921	
   922		switch (sw_event) {
   923		case DPU_ENC_RC_EVENT_KICKOFF:
   924			/* cancel delayed off work, if any */
   925			if (cancel_delayed_work_sync(&dpu_enc->delayed_off_work))
   926				DPU_DEBUG_ENC(dpu_enc, "sw_event:%d, work cancelled\n",
   927						sw_event);
   928	
   929			mutex_lock(&dpu_enc->rc_lock);
   930	
   931			/* return if the resource control is already in ON state */
   932			if (dpu_enc->rc_state == DPU_ENC_RC_STATE_ON) {
   933				DRM_DEBUG_ATOMIC("id;%u, sw_event:%d, rc in ON state\n",
   934					      DRMID(drm_enc), sw_event);
   935				mutex_unlock(&dpu_enc->rc_lock);
   936				return 0;
   937			} else if (dpu_enc->rc_state != DPU_ENC_RC_STATE_OFF &&
   938					dpu_enc->rc_state != DPU_ENC_RC_STATE_IDLE) {
   939				DRM_DEBUG_ATOMIC("id;%u, sw_event:%d, rc in state %d\n",
   940					      DRMID(drm_enc), sw_event,
   941					      dpu_enc->rc_state);
   942				mutex_unlock(&dpu_enc->rc_lock);
   943				return -EINVAL;
   944			}
   945	
   946			if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
   947				_dpu_encoder_irq_enable(drm_enc);
   948			else
   949				_dpu_encoder_resource_enable(drm_enc);
   950	
   951			dpu_enc->rc_state = DPU_ENC_RC_STATE_ON;
   952	
   953			trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
   954					 dpu_enc->idle_pc_supported, dpu_enc->rc_state,
   955					 "kickoff");
   956	
   957			mutex_unlock(&dpu_enc->rc_lock);
   958			break;
   959	
   960		case DPU_ENC_RC_EVENT_FRAME_DONE:
   961			/*
   962			 * mutex lock is not used as this event happens at interrupt
   963			 * context. And locking is not required as, the other events
   964			 * like KICKOFF and STOP does a wait-for-idle before executing
   965			 * the resource_control
   966			 */
   967			if (dpu_enc->rc_state != DPU_ENC_RC_STATE_ON) {
   968				DRM_DEBUG_KMS("id:%d, sw_event:%d,rc:%d-unexpected\n",
   969					      DRMID(drm_enc), sw_event,
   970					      dpu_enc->rc_state);
   971				return -EINVAL;
   972			}
   973	
   974			/*
   975			 * schedule off work item only when there are no
   976			 * frames pending
   977			 */
   978			if (dpu_crtc_frame_pending(drm_enc->crtc) > 1) {
   979				DRM_DEBUG_KMS("id:%d skip schedule work\n",
   980					      DRMID(drm_enc));
   981				return 0;
   982			}
   983	
   984			queue_delayed_work(priv->wq, &dpu_enc->delayed_off_work,
   985					   msecs_to_jiffies(dpu_enc->idle_timeout));
   986	
   987			trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
   988					 dpu_enc->idle_pc_supported, dpu_enc->rc_state,
   989					 "frame done");
   990			break;
   991	
   992		case DPU_ENC_RC_EVENT_PRE_STOP:
   993			/* cancel delayed off work, if any */
   994			if (cancel_delayed_work_sync(&dpu_enc->delayed_off_work))
   995				DPU_DEBUG_ENC(dpu_enc, "sw_event:%d, work cancelled\n",
   996						sw_event);
   997	
   998			mutex_lock(&dpu_enc->rc_lock);
   999	
  1000			if (is_vid_mode &&
  1001				  dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE) {
  1002				_dpu_encoder_irq_enable(drm_enc);
  1003			}
  1004			/* skip if is already OFF or IDLE, resources are off already */
  1005			else if (dpu_enc->rc_state == DPU_ENC_RC_STATE_OFF ||
  1006					dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE) {
  1007				DRM_DEBUG_KMS("id:%u, sw_event:%d, rc in %d state\n",
  1008					      DRMID(drm_enc), sw_event,
  1009					      dpu_enc->rc_state);
  1010				mutex_unlock(&dpu_enc->rc_lock);
  1011				return 0;
  1012			}
  1013	
  1014			dpu_enc->rc_state = DPU_ENC_RC_STATE_PRE_OFF;
  1015	
  1016			trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
  1017					 dpu_enc->idle_pc_supported, dpu_enc->rc_state,
  1018					 "pre stop");
  1019	
  1020			mutex_unlock(&dpu_enc->rc_lock);
  1021			break;
  1022	
  1023		case DPU_ENC_RC_EVENT_STOP:
  1024			mutex_lock(&dpu_enc->rc_lock);
  1025	
  1026			/* return if the resource control is already in OFF state */
  1027			if (dpu_enc->rc_state == DPU_ENC_RC_STATE_OFF) {
  1028				DRM_DEBUG_KMS("id: %u, sw_event:%d, rc in OFF state\n",
  1029					      DRMID(drm_enc), sw_event);
  1030				mutex_unlock(&dpu_enc->rc_lock);
  1031				return 0;
  1032			} else if (dpu_enc->rc_state == DPU_ENC_RC_STATE_ON) {
  1033				DRM_ERROR("id: %u, sw_event:%d, rc in state %d\n",
  1034					  DRMID(drm_enc), sw_event, dpu_enc->rc_state);
  1035				mutex_unlock(&dpu_enc->rc_lock);
  1036				return -EINVAL;
  1037			}
  1038	
  1039			/**
  1040			 * expect to arrive here only if in either idle state or pre-off
  1041			 * and in IDLE state the resources are already disabled
  1042			 */
  1043			if (dpu_enc->rc_state == DPU_ENC_RC_STATE_PRE_OFF)
  1044				_dpu_encoder_resource_disable(drm_enc);
  1045	
  1046			dpu_enc->rc_state = DPU_ENC_RC_STATE_OFF;
  1047	
  1048			trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
  1049					 dpu_enc->idle_pc_supported, dpu_enc->rc_state,
  1050					 "stop");
  1051	
  1052			mutex_unlock(&dpu_enc->rc_lock);
  1053			break;
  1054	
  1055		case DPU_ENC_RC_EVENT_ENTER_IDLE:
  1056			mutex_lock(&dpu_enc->rc_lock);
  1057	
  1058			if (dpu_enc->rc_state != DPU_ENC_RC_STATE_ON) {
  1059				DRM_ERROR("id: %u, sw_event:%d, rc:%d !ON state\n",
  1060					  DRMID(drm_enc), sw_event, dpu_enc->rc_state);
  1061				mutex_unlock(&dpu_enc->rc_lock);
  1062				return 0;
  1063			}
  1064	
  1065			/*
  1066			 * if we are in ON but a frame was just kicked off,
  1067			 * ignore the IDLE event, it's probably a stale timer event
  1068			 */
  1069			if (dpu_enc->frame_busy_mask[0]) {
  1070				DRM_ERROR("id:%u, sw_event:%d, rc:%d frame pending\n",
  1071					  DRMID(drm_enc), sw_event, dpu_enc->rc_state);
  1072				mutex_unlock(&dpu_enc->rc_lock);
  1073				return 0;
  1074			}
  1075	
  1076			if (is_vid_mode)
  1077				_dpu_encoder_irq_disable(drm_enc);
  1078			else
  1079				_dpu_encoder_resource_disable(drm_enc);
  1080	
  1081			dpu_enc->rc_state = DPU_ENC_RC_STATE_IDLE;
  1082	
  1083			trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
  1084					 dpu_enc->idle_pc_supported, dpu_enc->rc_state,
  1085					 "idle");
  1086	
  1087			mutex_unlock(&dpu_enc->rc_lock);
  1088			break;
  1089	
  1090		default:
  1091			DRM_ERROR("id:%u, unexpected sw_event: %d\n", DRMID(drm_enc),
  1092				  sw_event);
  1093			trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
  1094					 dpu_enc->idle_pc_supported, dpu_enc->rc_state,
  1095					 "error");
  1096			break;
  1097		}
  1098	
  1099		trace_dpu_enc_rc(DRMID(drm_enc), sw_event,
  1100				 dpu_enc->idle_pc_supported, dpu_enc->rc_state,
  1101				 "end");
  1102		return 0;
  1103	}
  1104	
  1105	/**
  1106	 * dpu_encoder_prepare_wb_job - prepare writeback job for the encoder.
  1107	 * @drm_enc:    Pointer to previously created drm encoder structure
  1108	 * @job:        Pointer to the current drm writeback job
  1109	 */
  1110	void dpu_encoder_prepare_wb_job(struct drm_encoder *drm_enc,
  1111			struct drm_writeback_job *job)
  1112	{
  1113		struct dpu_encoder_virt *dpu_enc;
  1114		int i;
  1115	
  1116		dpu_enc = to_dpu_encoder_virt(drm_enc);
  1117	
  1118		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
  1119			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
  1120	
  1121			if (phys->ops.prepare_wb_job)
  1122				phys->ops.prepare_wb_job(phys, job);
  1123	
  1124		}
  1125	}
  1126	
  1127	/**
  1128	 * dpu_encoder_cleanup_wb_job - cleanup writeback job for the encoder.
  1129	 * @drm_enc:    Pointer to previously created drm encoder structure
  1130	 * @job:        Pointer to the current drm writeback job
  1131	 */
  1132	void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
  1133			struct drm_writeback_job *job)
  1134	{
  1135		struct dpu_encoder_virt *dpu_enc;
  1136		int i;
  1137	
  1138		dpu_enc = to_dpu_encoder_virt(drm_enc);
  1139	
  1140		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
  1141			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
  1142	
  1143			if (phys->ops.cleanup_wb_job)
  1144				phys->ops.cleanup_wb_job(phys, job);
  1145	
  1146		}
  1147	}
  1148	
  1149	static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
  1150						     struct drm_crtc_state *crtc_state,
  1151						     struct drm_connector_state *conn_state)
  1152	{
  1153		struct dpu_encoder_virt *dpu_enc;
  1154		struct msm_drm_private *priv;
  1155		struct dpu_kms *dpu_kms;
  1156		struct dpu_global_state *global_state;
  1157		struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
  1158		struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
  1159		struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
  1160		struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
  1161		int num_ctl, num_pp, num_dsc;
  1162		int num_cwb = 0;
  1163		bool is_cwb_encoder;
  1164		unsigned int dsc_mask = 0;
  1165		unsigned int cwb_mask = 0;
  1166		int i;
  1167	
  1168		if (!drm_enc) {
  1169			DPU_ERROR("invalid encoder\n");
  1170			return;
  1171		}
  1172	
  1173		dpu_enc = to_dpu_encoder_virt(drm_enc);
  1174		DPU_DEBUG_ENC(dpu_enc, "\n");
  1175	
  1176		priv = drm_enc->dev->dev_private;
  1177		dpu_kms = to_dpu_kms(priv->kms);
  1178		is_cwb_encoder = drm_crtc_in_clone_mode(crtc_state) &&
  1179				dpu_enc->disp_info.intf_type == INTF_WB;
  1180	
  1181		global_state = dpu_kms_get_existing_global_state(dpu_kms);
  1182		if (IS_ERR_OR_NULL(global_state)) {
  1183			DPU_ERROR("Failed to get global state");
  1184			return;
  1185		}
  1186	
  1187		trace_dpu_enc_mode_set(DRMID(drm_enc));
  1188	
  1189		/* Query resource that have been reserved in atomic check step. */
  1190		if (is_cwb_encoder) {
  1191			num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
  1192							       drm_enc->crtc,
  1193							       DPU_HW_BLK_DCWB_PINGPONG,
  1194							       hw_pp, ARRAY_SIZE(hw_pp));
  1195			num_cwb = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
  1196							       drm_enc->crtc,
  1197							       DPU_HW_BLK_CWB,
  1198							       hw_cwb, ARRAY_SIZE(hw_cwb));
  1199		} else {
  1200			num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
  1201							       drm_enc->crtc,
  1202							       DPU_HW_BLK_PINGPONG, hw_pp,
  1203							       ARRAY_SIZE(hw_pp));
  1204		}
  1205	
  1206		for (i = 0; i < num_cwb; i++) {
> 1207			dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
  1208			cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
  1209		}
  1210	
  1211		dpu_enc->cwb_mask = cwb_mask;
  1212	
  1213		num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
  1214			drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
  1215	
  1216		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
  1217			dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
  1218							: NULL;
  1219	
  1220		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
  1221							drm_enc->crtc, DPU_HW_BLK_DSC,
  1222							hw_dsc, ARRAY_SIZE(hw_dsc));
  1223		for (i = 0; i < num_dsc; i++) {
  1224			dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
  1225			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
  1226		}
  1227	
  1228		dpu_enc->dsc_mask = dsc_mask;
  1229	
  1230		if ((dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) ||
  1231		    dpu_enc->disp_info.intf_type == INTF_DP) {
  1232			struct dpu_hw_blk *hw_cdm = NULL;
  1233	
  1234			dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
  1235						      drm_enc->crtc, DPU_HW_BLK_CDM,
  1236						      &hw_cdm, 1);
  1237			dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
  1238		}
  1239	
  1240		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
  1241			struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
  1242	
  1243			phys->hw_pp = dpu_enc->hw_pp[i];
  1244			if (!phys->hw_pp) {
  1245				DPU_ERROR_ENC(dpu_enc,
  1246					"no pp block assigned at idx: %d\n", i);
  1247				return;
  1248			}
  1249	
  1250			phys->hw_ctl = i < num_ctl ? to_dpu_hw_ctl(hw_ctl[i]) : NULL;
  1251			if (!phys->hw_ctl) {
  1252				DPU_ERROR_ENC(dpu_enc,
  1253					"no ctl block assigned at idx: %d\n", i);
  1254				return;
  1255			}
  1256	
  1257			phys->cached_mode = crtc_state->adjusted_mode;
  1258			if (phys->ops.atomic_mode_set)
  1259				phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
  1260		}
  1261	}
  1262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
