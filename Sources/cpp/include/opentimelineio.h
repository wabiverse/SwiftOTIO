//
//  opentimelineio.h
//
// SPDX-License-Identifier: Apache-2.0
// Copyright Contributors to the OpenTimelineIO project

#include <opentimelineio/clip.h>
#include <opentimelineio/composable.h>
#include <opentimelineio/composition.h>
#include <opentimelineio/effect.h>
#include <opentimelineio/externalReference.h>
#include <opentimelineio/freezeFrame.h>
#include <opentimelineio/gap.h>
#include <opentimelineio/generatorReference.h>
#include <opentimelineio/item.h>
#include <opentimelineio/linearTimeWarp.h>
#include <opentimelineio/marker.h>
#include <opentimelineio/mediaReference.h>
#include <opentimelineio/missingReference.h>
#include <opentimelineio/serializableCollection.h>
#include <opentimelineio/serializableObject.h>
#include <opentimelineio/serializableObjectWithMetadata.h>
#include <opentimelineio/stack.h>
#include <opentimelineio/timeEffect.h>
#include <opentimelineio/timeline.h>
#include <opentimelineio/track.h>
#include <opentimelineio/transition.h>
#include <opentimelineio/stack.h>
#include <opentimelineio/stringUtils.h>
#include <opentimelineio/unknownSchema.h>
#include <opentimelineio/stringUtils.h>
#include <opentimelineio/trackAlgorithm.h>
#include <opentimelineio/stackAlgorithm.h>

namespace otio {
  using namespace opentimelineio::OPENTIMELINEIO_VERSION;
  
  Clip* otio_new_clip();
  Composable* otio_new_composable();
  Composition* otio_new_composition();
  Effect* otio_new_effect();
  ExternalReference* otio_new_external_reference();
  FreezeFrame* otio_new_freeze_frame();
  Gap* otio_new_gap();
  GeneratorReference* otio_new_generator_reference();
  Item* otio_new_item();
  LinearTimeWarp* otio_new_linear_time_warp();
  Marker* otio_new_marker();
  MediaReference* otio_new_media_reference();
  MissingReference* otio_new_missing_reference();
  SerializableCollection* otio_new_serializable_collection();
  SerializableObject* otio_new_serializable_object();
  SerializableObjectWithMetadata* otio_new_serializable_object_with_metadata();
  Stack* otio_new_stack();
  TimeEffect* otio_new_time_effect();
  Timeline* otio_new_timeline();
  Track* otio_new_track();
  Transition* otio_new_transition();
}
