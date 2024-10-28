//
//  opentimelineio.m
//  otio_macos
//
// SPDX-License-Identifier: Apache-2.0
// Copyright Contributors to the OpenTimelineIO project

#include <opentimelineio.h>

namespace otio {

// MARK: - otio_new_XXX() methods

Clip* otio_new_clip() {
    return new Clip;
    /*
    Clip* c = new Clip;
    AnyDictionary d, d2;
    d["abc"] = 123;
    d["xyz"] = 456;
    
    d2["r1"] = RationalTime(1,2);
    d2["r2"] = RationalTime(100,200);
    d2["plugh"] = 37;
    
    d["nested"] = d2;
    c->metadata() = d;
    return c;*/
}

Composable* otio_new_composable() {
    return new Composable;
}

Composition* otio_new_composition() {
    return new Composition;
}

Effect* otio_new_effect() {
    return new Effect;
}

ExternalReference* otio_new_external_reference() {
    return new ExternalReference;
}

FreezeFrame* otio_new_freeze_frame() {
    return new FreezeFrame;
}

Gap* otio_new_gap() {
    return new Gap;
}

GeneratorReference* otio_new_generator_reference() {
    return new GeneratorReference;
}

Item* otio_new_item() {
    return new Item;
}

LinearTimeWarp* otio_new_linear_time_warp() {
    return new LinearTimeWarp;
}

Marker* otio_new_marker() {
    return new Marker;
}

MediaReference* otio_new_media_reference() {
    return new MediaReference;
}

MissingReference* otio_new_missing_reference() {
    return new MissingReference;
}

SerializableCollection* otio_new_serializable_collection() {
    return new SerializableCollection;
}

SerializableObject* otio_new_serializable_object() {
    return new SerializableObject;
}

SerializableObjectWithMetadata* otio_new_serializable_object_with_metadata() {
    return new SerializableObjectWithMetadata;
}

Stack* otio_new_stack() {
    return new Stack;
}

TimeEffect* otio_new_time_effect() {
    return new TimeEffect;
}

Timeline* otio_new_timeline() {
    return new Timeline;
}

Track* otio_new_track() {
    return new Track;
}

Transition* otio_new_transition() {
    return new Transition;
}

} // namespace otio
